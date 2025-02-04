class BlockedDate < ApplicationRecord
  belongs_to :rental, optional: true
  validates_presence_of :start_date, :finish_date
  validates :validates_dates

  def validates_dates
    self.finish_date >= self.start_date
  end
end
