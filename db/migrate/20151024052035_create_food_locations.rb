class CreateFoodLocations < ActiveRecord::Migration
  def change
    create_table :food_locations do |t|
      t.timestamps null: false
      t.string :name
      t.string :address
      t.integer :zip
      t.float :latitude
	  t.float :longitude
    end
  end
end
