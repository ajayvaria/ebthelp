class FoodLocation < ActiveRecord::Base
  reverse_geocoded_by :latitude, :longitude
	geocoded_by :address
	after_validation :geocode

	def clean_name
		name.titleize.gsub(/\s+\d+$/, '')
	end
	
	def self.localize(location)
	  if location && location !~ /(san francisco)/i
	    location += ", san francisco"
    end
    
    location
  end
end
