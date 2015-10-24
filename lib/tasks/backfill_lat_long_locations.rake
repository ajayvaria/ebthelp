desc "For all FoodLocation objects with no lat/long, backfill it based on the address."
task backfill_lat_long_locations: :environment do
	FoodLocation.all.each do |food_location|
    if food_location.latitude.nil? 
      coords = Geocoder.coordinates("%s, %d" % [food_location.address, food_location.zip])
      food_location.latitude = coords[0]
      food_location.longitude = coords[1]
      puts food_location.latitude
      puts food_location.longitude
      food_location.save
    end
  end
end