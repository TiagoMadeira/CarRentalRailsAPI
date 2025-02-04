class Rental < ApplicationRecord
  belongs_to :vehicle
  belongs_to :user
  has_one :blocked_date
  accepts_nested_attributes_for :blocked_date, allow_destroy: true


  STATES = %i[canceled concluded ongoing upcoming]

  # VALIDATIONS

  # create
  validates_presence_of :blocked_date, :user_id, :vehicle_id, on: :create

  # create & update
  validate :validates_dates, on: [ :create, :update ], if: :should_validate_dates?


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


  def cancelable?
    rental_state == STATES[3]
  end

  private

  def should_validate_dates?
    self.canceled == False
  end
  # Ment to be used as a validation auxiliary method, excludes self blocked from array
  def vehicle_blocked_dates
    self.vehicle.blocked_dates.reject { |b| b.id == blocked_date.id }
  end

  def  destroy_blocked_date_if_canceled
    self.blocked_date.destroy if saved_change_to_canceled?
  end

  # Validation Methods
  def validates_cancel
    errors.add("Rental cannot be canceled") unless cancelable?
  end

  # Checks if passed blocked_dates overlap with vehicle's active_blocked_dates
  def validates_dates
    dates_available
    set_correct_time
  end

  def dates_available
    vehicle_blocked_dates.each do |vehicle_blocked_date|
      if blocked_date.start_date <= vehicle_blocked_date.finish_date && vehicle_blocked_date.start_date <= blocked_date.finish_date
        errors.add(:blocked_date, "Vehicle is not available for rent at the inserted dates!")
        break
      end
    end
  end

  def set_correct_time
    errors.add(:blocked_date, "finish and start dates shouldn't be before today") unless blocked_date.finish_date > Date.today &&  blocked_date.start_date > Date.today
  end
end
