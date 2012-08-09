class CreateBookingHistories < ActiveRecord::Migration
  def change
    create_table :booking_histories do |t|
      t.integer :booking_id

      t.timestamps
    end
  end
end
