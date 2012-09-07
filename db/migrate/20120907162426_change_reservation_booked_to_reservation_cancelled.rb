class ChangeReservationBookedToReservationCancelled < ActiveRecord::Migration
  def change
    rename_column :bookings, :reservation_booked, :reservation_cancelled
  end
end
