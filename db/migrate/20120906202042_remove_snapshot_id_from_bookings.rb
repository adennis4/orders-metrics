class RemoveSnapshotIdFromBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :booking_snapshot_id
  end
end
