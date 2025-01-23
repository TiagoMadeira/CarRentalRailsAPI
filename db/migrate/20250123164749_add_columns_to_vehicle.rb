class AddColumnsToVehicle < ActiveRecord::Migration[7.2]
  def change
    add_column :vehicles, :brand, :string, null: false
    add_column :vehicles, :model, :string, null: false
  end
end
