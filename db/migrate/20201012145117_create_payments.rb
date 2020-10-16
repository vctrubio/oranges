class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.references :employee, null: true, foreign_key: true
      t.date :date
      t.string :title
      t.float :price
      t.boolean "ticket"


      t.timestamps
    end
  end
end

