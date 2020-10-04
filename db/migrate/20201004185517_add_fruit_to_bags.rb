class AddFruitToBags < ActiveRecord::Migration[6.0]
  def change
    add_column :bags, :fruit, :string
  end
end
