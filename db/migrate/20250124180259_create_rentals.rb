class CreateRentals < ActiveRecord::Migration[7.2]
  def change
    create_table :rentals do |t|
      t.boolean :canceled
      t.belongs_to :user
      t.belongs_to :vehicle
      t.timestamps
    end
  end
end
