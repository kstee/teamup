class AddDefaultValueToStatusInListings < ActiveRecord::Migration
	def up
	  change_column :listings, :status, :integer, default: 0
	end

	def down
	  change_column :listings, :status, :integer, default: nil
	end
end
