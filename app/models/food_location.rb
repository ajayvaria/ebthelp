class FoodLocation < ActiveRecord::Base
  reverse_geocoded_by :latitude, :longitude
	geocoded_by :address
	# after_validation :geocode

	def clean_name
		name.titleize.gsub(/\s+\d+$/, '')
	end
	
	def localized_address
	  FoodLocation.localize(address)
  end
	
	def self.localize(location)
	  if location && location !~ /(san francisco)/i
	    location += ", San Francisco, CA"
    end
    
    location
  end
  
  def yelp_url
    "http://www.yelp.com/biz/#{yelp_id}"
  end
end
