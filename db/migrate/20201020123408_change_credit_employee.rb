class ChangeCreditEmployee < ActiveRecord::Migration[6.0]
  def change
    change_column :employees, :credit, :float
  end
end
