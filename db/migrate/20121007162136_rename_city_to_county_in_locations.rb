class RenameCityToCountyInLocations < ActiveRecord::Migration
  def change
    rename_column :locations, :city, :county  
    remove_column :locations, :country  
  end
end
