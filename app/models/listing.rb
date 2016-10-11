class Listing < ActiveRecord::Base

  attr_accessor :raw_address

  geocoded_by :raw_address
  after_validation -> {
    self.address = self.raw_address
    geocode
  }, if: ->(obj){ obj.raw_address.present? and obj.raw_address != obj.address }

  after_validation :reverse_geocode, unless: ->(obj) { obj.raw_address.present? },
                 if: ->(obj){ obj.latitude.present? and obj.latitude_changed? and obj.longitude.present? and obj.longitude_changed? }
	has_many :user_listing
	has_many :users, through: :user_listing, dependent: :destroy
	belongs_to :activity
	belongs_to :user
  scope :activity_id, -> (id) { where('activity_id IN (?)', id) }
  enum status: { Open: 0, Close: 1, Expired: 2 } #if in symbol will also be converted to string
  searchkick
  
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

  def approve!(requester)
    @user_listing = self.user_listing.find_by(user_id: requester)
    @user_listing.update(isApproved: true)
    self.pax_existing += 1
    self.pax_required -= 1
    self.status = 1 if self.pax_required == 0
    self.save
  end
 	
end
