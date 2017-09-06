class AddLongitudeAndLatitudeToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :longitude, :float
    add_column :listings, :latitude, :float
  end
end
