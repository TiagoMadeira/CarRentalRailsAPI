class BlockedDate < ApplicationRecord
  belongs_to :rental, optional: true
  validates_presence_of :start_date, :finish_date
  validate :dates_are_correct

  def dates_are_correct
    errors.add("finish date should come later than start date") unless self.finish_date >= self.start_date
    errors.add("finish and start dates shouldn't be set on the past") unless blocked_date.finish_date > Date.today &&  blocked_date.start_date > Date.today
  end
end
