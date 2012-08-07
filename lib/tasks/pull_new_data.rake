require 'yahoo_stock'

namespace :booking do
  desc "query database for updated bookings data"
  task :update_bookings_table => :environment do
    b = Booking.new
    b.update_bookings_table
  end
end

namespace :cancellation do
  desc "query database for updated cancellation data"
  task :update_cancellations_table => :environment do
    c = Cancellation.new
    c.update_cancellations_table
  end
end