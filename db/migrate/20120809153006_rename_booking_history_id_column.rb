class RenameBookingHistoryIdColumn < ActiveRecord::Migration
  def change
    rename_column :bookings, :booking_history_id, :booking_snapshot_id
  end
end
