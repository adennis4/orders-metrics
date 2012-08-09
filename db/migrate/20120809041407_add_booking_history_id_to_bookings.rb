class AddBookingHistoryIdToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :booking_history_id, :integer
  end
end
