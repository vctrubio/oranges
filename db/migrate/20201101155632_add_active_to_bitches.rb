class AddActiveToBitches < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :inactive, :boolean,  :default => false

  end
end
