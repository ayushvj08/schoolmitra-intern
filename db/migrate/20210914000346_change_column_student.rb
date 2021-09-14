class ChangeColumnStudent < ActiveRecord::Migration[6.1]
  def change
    remove_column :students, :date_of_birth
    add_column :students, :date_of_birth, :date
  end
end
