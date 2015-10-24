# API key: AIzaSyBVFHi2r_gogB0ynWkVrjPLy84QEjTfa_A

# Consumer Key	wV-vxRevtHiwwPSCtyMa9g
# Consumer Secret	PLsbGN00G5fkrCZWouBtFS8ibM0
# Token	YIgyQjZ4SifLAwXivDMCJcAs3hgGI3GT
# Token Secret	-6-Hn_Sv_8-I_2VwYLeIrj2hycE

desc "For all FoodLocation objects in the csv, add the url. Also add the yelp id."
task ingest_street_images: :environment do
	i = 0
	CSV.foreach('datafiles/imageurls.csv', :headers => true) do |row|
		# YelpId,ImageUrl,Address,Name
    # FoodLocation.create!(row.to_hash)
    yelp_id = row[0]
    image_url = row[1]
    latitude = row[2]
    address = row[3]
    name = row[4]
    fl = FoodLocation.find_by name: name
    if not fl.nil?
    	fl.yelp_id = yelp_id
	    fl.image_url = image_url
	  	puts fl.yelp_id
	  	fl.save
	  	i += 1
	  	if i % 5 == 0
	  		sleep(1)
	  	end
	  end
  end
end