class Activity < ActiveRecord::Base

  #searchkick match: :word_start, searchable: [:listing_name]
  belongs_to :user
  has_many :listings, dependent: :destroy

end
