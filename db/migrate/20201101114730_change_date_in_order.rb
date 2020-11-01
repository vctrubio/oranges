class ChangeDateInOrder < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :date, :date
  end
end
