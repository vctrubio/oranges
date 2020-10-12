class ModifyPickups < ActiveRecord::Migration[6.0]
  def change
    remove_column :pickups, :addcost
    change_column :pickups, :cost, :float,  :default => 0.0
  end
end
