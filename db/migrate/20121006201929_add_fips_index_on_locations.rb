class AddFipsIndexOnLocations < ActiveRecord::Migration
  def change
    add_index :locations, :fips_county_code
  end
end
