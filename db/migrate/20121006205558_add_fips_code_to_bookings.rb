class AddFipsCodeToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :fips_county_code, :integer
    add_index :bookings, :fips_county_code
  end
end
