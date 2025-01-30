class Vehicle < ApplicationRecord
  belongs_to :user
  has_many :rentals
  has_many :active_rentals, -> { where(canceled: false) }, class_name: "Rental"
  has_many :active_blocked_dates, through: :active_rentals, class_name: "BlockedDate"

  enum category: [ :small, :medium, :big, :suv, :truck ]
  enum transmission: [ :manual, :auto ]
  enum vehicle_type: [ :car, :motorcycle, :ev, :evcycle ]
  enum capacity: [ "1-4", "5-6", "7 plus" ].freeze

  validates_presence_of :brand, :model, :cost, :user
  validates :brand, :model, length: { maximum: 15 }
end
