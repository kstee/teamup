class Activity < ActiveRecord::Base

  #searchkick match: :word_start, searchable: [:listing_name]
  # has_many :user_activities
  has_many :users, through: :user_activity, dependent: :destroy
  has_many :listings, dependent: :destroy

end
