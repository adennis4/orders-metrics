require 'yahoo_stock'

namespace :booking do
  desc "query database for updated bookings data"
  task :update_bookings_table => :environment do
    m = Bookings.new
    m.update_bookings_table
  end
end