class ChangePriceInOrder < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :price, :float,  :default => 0
  end
end
