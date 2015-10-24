class FoodLocationYelp < ActiveRecord::Migration
  def change
    add_column :food_locations, :yelp_id, :string
  end
end
