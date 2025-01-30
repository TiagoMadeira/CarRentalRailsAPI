class RentalSerializer < ActiveModel::Serializer
  has_one :blocked_date

  attributes :id, :vehicle_id, :user_id, :rental_state, :total_rental_cost, :blocked_date
end
