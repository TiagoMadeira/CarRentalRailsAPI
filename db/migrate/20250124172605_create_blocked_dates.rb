class CreateBlockedDates < ActiveRecord::Migration[7.2]
  def change
    create_table :blocked_dates do |t|
      t.date :start_date
      t.date :finish_date

      t.timestamps
    end
  end
end
