class RenameBookingHistoriesToBookingSnapshots < ActiveRecord::Migration
  def change
    rename_table :booking_histories, :booking_snapshots
  end
end
