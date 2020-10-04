class CreateBags < ActiveRecord::Migration[6.0]
  def change
    create_table :bags do |t|
      t.integer :quantity
      t.integer :price
      t.references :pickup, null: false, foreign_key: true

      t.timestamps
    end
  end
end
