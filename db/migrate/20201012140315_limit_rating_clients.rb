class LimitRatingClients < ActiveRecord::Migration[6.0]
  def change
    change_column :clients, :rating, :integer,  :default => 0,   limit: 3
  end
end
