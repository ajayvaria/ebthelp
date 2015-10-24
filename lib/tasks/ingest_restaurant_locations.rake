require 'csv'
desc "Read a CSV of location name, address, zip, and save to the FoodLocation model."
task read_csv_restaurant_locations: :environment do
    CSV.foreach('datafiles/calfresh_restaurants.csv', :headers => true) do |row|
        # Name, Address, Zip
    # FoodLocation.create!(row.to_hash)
    name = row[0]
    address = row[1]
    zip = row[2]
    FoodLocation.create!({name:name, address:address, zip:zip})
  end
end