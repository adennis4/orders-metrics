namespace :booking do
  desc "adds multiple entries to bookings table"
  task :add_entries => :environment do
    number_of_tasks = rand(80) + 20
    name = "Getaways"
    status = randomize_status
    ip_address = randomize_ip_address
    number_of_tasks.times do
      Booking.add_booking(name, status, ip_address)
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