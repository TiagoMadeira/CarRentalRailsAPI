class AddRentalRefToBlockedDates < ActiveRecord::Migration[7.2]
  def change
    add_reference :blocked_dates, :rental, null: false, foreign_key: true
  end
end
