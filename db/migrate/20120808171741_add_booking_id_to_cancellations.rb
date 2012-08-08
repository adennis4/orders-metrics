class AddBookingIdToCancellations < ActiveRecord::Migration
  def change
    add_column :cancellations, :booking_id, :integer
  end
end
