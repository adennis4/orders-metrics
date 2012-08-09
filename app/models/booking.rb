class Booking < ActiveRecord::Base
  attr_accessible :metric_1, :name, :booking_history_id

  has_one :cancellation
  belongs_to :booking_history

  validates :name, :presence => true
  validates :metric_1, :presence => true, :numericality => true
  validates :booking_history_id, :presence => true, :numericality => true

  def update_bookings
    dummy_symbols = ['GOOG', 'LNKD', 'ZNGA']
    new_history = BookingHistory.create
    dummy_symbols.each do |symbol|
      dummy_data = YahooStock::Quote.new(:stock_symbols => symbol)
      dummy_data.use_all_parameters
      dummy_data_hash = dummy_data.results(:to_hash).output.first

      b = Booking.new
      b[:name] = dummy_data_hash[:name]
      b[:metric_1] = dummy_data_hash[:last_trade_price_only]
      b[:booking_history_id] = new_history.id
      b.save!
    end
  end
end
