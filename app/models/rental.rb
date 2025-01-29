class Rental < ApplicationRecord
  belongs_to :vehicle
  belongs_to :user
  has_one :blocked_date
  accepts_nested_attributes_for :blocked_date

  STATES = %i[canceled concluded  ongoing upcoming]
  validates_presence_of :blocked_date

  def total_rental_cost
    self.vehicle.cost * (self.blocked_date.finish_date - self.blocked_date.start_date)
  end

  def rental_state
    if self.canceled
      STATES[0]
    elsif Date.today > self.blocked_date.finish_date
      STATES[1]
    elsif Date.today.between?(self.blocked_date.start_date,  self.blocked_date.finish_date)
      STATES[2]
    else
      STATES[3]
    end
  end
end
