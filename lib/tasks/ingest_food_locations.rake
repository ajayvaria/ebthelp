require 'csv'
desc "Read a CSV of location name, address, zip, and lat/long data and save to the FoodLocation model."
task read_csv_locations: :environment do
	CSV.foreach('datafiles/calfresh_grocery.csv', :headers => true) do |row|
		# Store_Name,Longitude,Latitude,Address,Address Line #2,City,State,Zip5,Zip4,County
    # FoodLocation.create!(row.to_hash)
    name = row[0]
    longitude = row[1]
    latitude = row[2]
    address = row[3]
    city = row[5]
    zip = row[7]
    if city == "San Francisco"
    	fl = FoodLocation.create!({name:name, longitude:longitude, latitude:latitude, address:address, zip:zip})
  	end
  end
end