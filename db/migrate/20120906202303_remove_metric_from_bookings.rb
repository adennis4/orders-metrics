class RemoveMetricFromBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :metric_1
  end
end
