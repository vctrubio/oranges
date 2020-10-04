class CreateLandlords < ActiveRecord::Migration[6.0]
  def change
    create_table :landlords do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :description
      t.integer :fields

      t.timestamps
    end
  end
end
