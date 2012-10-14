namespace :write_to_csv do
  desc "appends new entries to csv for bookings and cancellations"
  task :update_all => :environment do
    Rake::Task["write_to_csv:update_bookings"].invoke
    Rake::Task["write_to_csv:update_cancellations"].invoke
  end

  task :update_bookings => :environment do
    Booking.write_to_bookings_csv
  end

  task :update_cancellations => :environment do
    Booking.write_to_cancellations_csv
  end
end