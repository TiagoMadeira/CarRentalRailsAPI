class CreateVehicles < ActiveRecord::Migration[7.2]
  def change
    create_table :vehicles do |t|
      t.integer :category, default: 0
      t.integer :transmission, default: 0
      t.integer :type, default: 0
      t.decimal :cost, null: false
      t.integer :capacity, default: 0

      t.timestamps
    end
  end
end
