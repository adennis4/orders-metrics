class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :name
      t.float :metric_1

      t.timestamps
    end
  end
end
