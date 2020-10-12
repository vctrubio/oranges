class DefaultCreditToEmployees < ActiveRecord::Migration[6.0]
  def change
    change_column :employees, :credit, :integer,  :default => 0
    change_column :landlords, :fields, :integer,  :default => 0
    change_column :orders, :price, :integer,  :default => 0
    
  end
end
