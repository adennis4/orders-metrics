class Booking < ActiveRecord::Base
  attr_accessible :name, :location_id

  belongs_to :location

  validates :name, :presence => true
  #validates :metric_1, :presence => true, :numericality => true
  #validates :booking_snapshot_id, :presence => true, :numericality => true

  def update_bookings
    # symbol = 'GOOG'
    # new_history = BookingSnapshot.create
    # test_data = YahooStock::Quote.new(:stock_symbols => symbol)
    # test_data.use_all_parameters
    # test_data_hash = test_data.results(:to_hash).output.first

    # b = Booking.new
    # b[:name] = test_data_hash[:name]
    # b[:metric_1] = test_data_hash[:last_trade_price_only]
    # b[:booking_snapshot_id] = new_history.id
    # b.save!
  end
end