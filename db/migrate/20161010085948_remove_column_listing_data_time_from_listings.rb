class RemoveColumnListingDataTimeFromListings < ActiveRecord::Migration
  def change
  	remove_column :listings, :listing_datetime, :timestamp
  end
end
