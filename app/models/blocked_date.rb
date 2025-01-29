class BlockedDate < ApplicationRecord
  belongs_to :rental
  validates_presence_of :start_date, :finish_date
end
