class AddFieldsToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :status, :string
    add_column :bookings, :reservation_booked, :datetime
    add_column :bookings, :check_in, :datetime
    add_column :bookings, :check_out, :datetime
    add_column :bookings, :number_of_adults, :integer
    add_column :bookings, :number_of_children, :integer
    add_column :bookings, :number_of_rooms, :integer
    add_column :bookings, :ip_address, :string
    add_column :bookings, :destination, :string
  end
end
