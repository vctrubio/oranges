class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.string :zone
      t.text :description
      t.integer :rating
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
