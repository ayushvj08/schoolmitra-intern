class StudentController < ApplicationController
  def create_form
  end

  def create
    @new_student = current_user.create_student(
      name: params[:name],
      standard: params[:standard],
      section: params[:section],
      date_of_birth: params[:date_of_birth],
      admission_number: params[:admission_number],
      user_id: current_user.id,
    )
    @parent = current_user.student.create_parent(
      father_name: params[:father_name],
      mother_name: params[:mother_name],
      student_id: @new_student.id,
    )
    if @new_student.save && @parent.save
      redirect_to certificate_path(format: :pdf)
    else
      flash[:alert] = @new_student.errors.full_messages.join(", ")
      flash[:alert] = @parent.errors.full_messages.join(", ")
      redirect_to "/"
    end
  end

  def update_form
  end

  def update
    @student = current_user.student
    @student.name = params[:name]
    @student.standard = params[:standard]
    @student.section = params[:section]
    @student.date_of_birth = params[:date_of_birth]
    @student.admission_number = params[:admission_number]
    @parent = current_user.student.parent
    @parent.father_name = params[:father_name]
    @parent.mother_name = params[:mother_name]
    if @student.save && @parent.save
      redirect_to certificate_path(format: :pdf)
    else
      flash[:alert] = @new_student.errors.full_messages.join(", ")
      flash[:alert] = @parent.errors.full_messages.join(", ")
      redirect_to "/"
    end
  end
end
