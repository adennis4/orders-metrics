class AddFipsToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :fips_county_code, :integer
  end
end
