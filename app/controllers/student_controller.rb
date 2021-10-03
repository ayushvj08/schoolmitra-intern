class StudentController < ApplicationController
  def new
    @student = Student.new
    @parent = Parent.new
    @url = student_path
    render "form"
  end

  def edit
    @student = current_user.student
    @parent = @student.parent
    @url = student_path
    render "form"
  end

  def create
    @student = current_user.build_student(student_params)
    @parent = current_user.student.build_parent(parent_params)
    if @student.save && @parent.save
      flash[:notice] = "Your PDF will download shortly. "
      send_data CreatePdfJob.set(wait: 10.seconds).perform_later(current_user), filename: "Certificate.pdf", disposition: "attachment"
      # redirect_to "/"
    else
      flash[:alert] = @student.errors.full_messages.join(", ")
      flash[:alert] += @parent.errors.full_messages.join(", ")
      redirect_to "/"
    end
  end

  def update
    @student = current_user.student
    @parent = current_user.student.parent
    @student.update(student_params)
    @parent.update(parent_params)

    if @student.save && @parent.save
      flash[:notice] = "Your PDF will download shortly. "
      send_data CreatePdfJob.set(wait: 10.seconds).perform_later(current_user), filename: "Certificate.pdf", disposition: "attachment"
      # redirect_to "/"
    else
      flash[:alert] = @student.errors.full_messages.join(", ")
      flash[:alert] += @parent.errors.full_messages.join(", ")
      redirect_to "/"
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :standard, :date_of_birth, :section, :admission_number)
  end

  def parent_params
    params.require(:student).require(:parent).permit(:father_name, :mother_name)
  end
end
