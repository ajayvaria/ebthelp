class WelcomeController < ApplicationController
	def index
	  @q = params['q']
	  @localized_q = FoodLocation.localize(params['q'])
		@nearby_results = FoodLocation.near(@localized_q, 0.25)

    @coordinates_q = Geocoder.coordinates(@localized_q)


		@locations = []
		FoodLocation.all.each do |food_location|
			if food_location.latitude && food_location.latitude && food_location.latitude > 36.9 && food_location.latitude < 38.6 && food_location.longitude > -122.5 && food_location.longitude < -122.26
				@locations.push([food_location.clean_name, food_location.latitude, food_location.longitude])
			end
		end
		
	end
end