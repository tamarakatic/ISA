class ReservationOrder < ApplicationRecord
  belongs_to :reservation
  belongs_to :customer_order
end
