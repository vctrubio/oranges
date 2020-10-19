class AddFlatToClients < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :flat, :string
  end
end
