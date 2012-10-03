namespace :booking do
  desc "adds multiple entries to bookings table"
  task :add_entries => :environment do
    number_of_tasks = rand(80) + 20
    number_of_tasks.times do
      Booking.add_booking("Getaways", randomize_status, randomize_ip_address)
    end
  end

  desc "adds multiple confirmed entries to bookings table"
  task :add_confirmed => :environment do
    number_of_tasks = rand(80) + 20
    number_of_tasks.times do
      Booking.add_booking("Getaways", "confirmed", randomize_ip_address)
    end
  end

  desc "adds multiple cancelled entries to bookings table"
  task :add_cancelled => :environment do
    number_of_tasks = rand(20) + 5
    number_of_tasks.times do
      Booking.add_booking("Getaways", "cancelled", randomize_ip_address)
    end
  end

  def randomize_status
    status_array = ["confirmed"] * 9 << "cancelled"
    status_array[rand(10)]
  end

  def randomize_ip_address
    total_lines = 47242
    File.readlines('lib/ip_addresses.txt')[rand(total_lines)].strip
  end
end