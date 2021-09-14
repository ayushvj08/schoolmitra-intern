class AddStudentIdToParent < ActiveRecord::Migration[6.1]
  def change
    add_column :parents, :student_id, :integer
  end
end
