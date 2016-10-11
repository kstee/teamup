class AddTimeColumnsToListings < ActiveRecord::Migration
  def change
  	add_column :listings, :date, :timestamp
  	add_column :listings, :starttime, :timestamp
  	add_column :listings, :endtime, :timestamp
  end
end
