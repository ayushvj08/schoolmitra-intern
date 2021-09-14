class CreateParents < ActiveRecord::Migration[6.1]
  def change
    create_table :parents do |t|
      t.string :father_name
      t.string :mother_name

      t.timestamps
    end
  end
end
