class AddCommentToPickups < ActiveRecord::Migration[6.0]
  def change
    add_column :pickups, :comment, :string
  end
end
