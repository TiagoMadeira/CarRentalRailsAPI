class RentalSerializer < ActiveModel::Serializer
  has_one :blocked_date
  
  attributes :id, :vehicle_id, :user_id, :rental_state, :blocked_date
end
