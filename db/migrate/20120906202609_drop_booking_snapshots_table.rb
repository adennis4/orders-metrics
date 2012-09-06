class DropBookingSnapshotsTable < ActiveRecord::Migration
  def change
    drop_table :booking_snapshots
  end
end
