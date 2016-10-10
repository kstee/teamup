class Listing < ActiveRecord::Base

	has_many :user_listing
	has_many :users, through: :user_listing, dependent: :destroy
	belongs_to :activity
	belongs_to :user
  scope :activity_id, -> (id) { where('activity_id IN (?)', id) }
  enum status: { Open: 0, Close: 1, Expired: 2 } #if in symbol will also be converted to string

  def request(participant)
    @request = self.user_listing.find_by(user_id: participant)
  end

  def requested?(participant)
    !request(participant).nil?
  end

  def request!(participant)
    if requested?(participant)
      @request = request(participant)
      @request.delete
    else
      self.user_listing.create(user_id: participant)
    end
  end
 	
end
