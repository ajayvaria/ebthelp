class WelcomeController < ApplicationController
	def index
		locations = []
		FoodLocation.all.each do |food_location|
			locations.push([food_location.name, food_location.latitude, food_location.longitude])
		end
		@locations = locations
	end
end
