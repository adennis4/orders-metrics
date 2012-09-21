class RemoveReservationCancelledFromTable < ActiveRecord::Migration
  def change
    remove_column :bookings, :reservation_cancelled, :datetime
  end
end