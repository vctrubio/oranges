class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.references :order, null: false, foreign_key: true
      t.integer :kg
      t.string :fruit
      t.float :ppfruit
      t.float :tprice

      t.timestamps
    end
  end
end
