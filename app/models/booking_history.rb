class BookingHistory < ActiveRecord::Base
  attr_accessible :booking_id

  has_many :bookings

  validates :booking_id, :presence => true, :numericality => true
end
