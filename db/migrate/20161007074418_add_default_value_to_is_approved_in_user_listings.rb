class AddDefaultValueToIsApprovedInUserListings < ActiveRecord::Migration
	def up
	  change_column :user_listings, :isApproved, :boolean, default: false
	end

	def down
	  change_column :user_listings, :isApproved, :boolean, default: nil
	end
end
