class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :standard
      t.string :section
      t.string :date_of_birth
      t.string :admission_number

      t.timestamps
    end
  end
end
