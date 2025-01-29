class BlockedDateSerializer < ActiveModel::Serializer
  belongs_to :rental
  attributes :id, :start_date, :finish_date
end
