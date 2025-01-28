class Vehicle < ApplicationRecord
  belongs_to :user
  enum category: [ :small, :medium, :big, :suv, :truck ]
  enum transmission: [ :manual, :auto ]
  enum vehicle_type: [ :car, :motorcycle, :ev, :evcycle ]
  enum capacity: [ "1-4", "5-6", "7 plus" ].freeze

  validates_presence_of :brand, :model, :cost, :user
  validates :brand, :model, length: { maximum: 15 }
end
