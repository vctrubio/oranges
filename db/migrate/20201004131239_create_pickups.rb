class CreatePickups < ActiveRecord::Migration[6.0]
  def change
    create_table :pickups do |t|
      t.references :landlord, null: false, foreign_key: true
      t.date :date
      t.integer :kgs
      t.float :cost
      t.float :addcost

      t.timestamps
    end
  end
end
