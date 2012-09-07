class Weather < ActiveRecord::Base
  attr_accessible :condition, :location_id, :temperature

  belongs_to :location
end
