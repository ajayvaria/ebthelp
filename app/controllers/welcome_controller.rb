class WelcomeController < ApplicationController
	def index
		locations = []
		FoodLocation.all.each do |food_location|
			if food_location.latitude > 36.9 && food_location.latitude < 38.6 && food_location.longitude > -122.5 && food_location.longitude < -122.26
				locations.push([food_location.name, food_location.latitude, food_location.longitude])
			end
		end
		@locations = locations
	end
end
