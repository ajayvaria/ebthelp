class FoodLocation < ActiveRecord::Migration
  def change
  	add_column :food_locations, :image_url, :string
  end
end
