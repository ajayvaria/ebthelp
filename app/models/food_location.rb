class FoodLocation < ActiveRecord::Base
  reverse_geocoded_by :latitude, :longitude
	geocoded_by :address
	after_validation :geocode
end
