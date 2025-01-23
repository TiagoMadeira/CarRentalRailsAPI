class Vehicle < ApplicationRecord
  enum categroy: [ :small, :medium, :big, :suv, :lux ]
  enum transmission: [ :manual, :auto ]
  enum type: [ :car, :motocycle ]
  enum capacity: [ "1-4", "5-6", "7 plus" ].freeze

  validates_presence_of :brand, :model, :cost
  validates :brand, :model, length: { maximum: 15 }
end
