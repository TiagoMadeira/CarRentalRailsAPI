class AddRentalRefToBlockedDates < ActiveRecord::Migration[7.2]
  def change
    add_reference :blocked_dates, :rental, null: true, foreign_key: true, default: nil
  end
end
