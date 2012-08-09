class RemoveBookingIdFromBookingHistories < ActiveRecord::Migration
  def change
    remove_column :booking_histories, :booking_id
  end
end
