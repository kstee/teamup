class Listing < ActiveRecord::Base

	has_many :user_listing
	has_many :users, through: :user_listing, dependent: :destroy
	belongs_to :activity
	belongs_to :user

 	enum status: { open: 0, close: 1, expired: 2 } #if in symbol will also be converted to string
 

end
