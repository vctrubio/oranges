class CreateReceipts < ActiveRecord::Migration[6.0]
  def change
    create_table :receipts do |t|
      t.integer :kilos
      t.string :fruit
      t.float :ppfruit
      t.float :tprice
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
