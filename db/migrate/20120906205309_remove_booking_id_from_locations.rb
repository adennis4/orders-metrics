class RemoveBookingIdFromLocations < ActiveRecord::Migration
  def change
    remove_column :locations, :booking_id, :integer
  end
end
