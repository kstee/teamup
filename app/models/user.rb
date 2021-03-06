class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable,
         :omniauthable, :omniauth_providers => [:facebook]

  # associations
  has_many :user_activity #this model is for user profile to state their fav activity/skill level/etc
  has_many :activities, through: :user_activity, dependent: :destroy 
  has_many :listings, dependent: :destroy #this model is for users who created a listing
  has_many :user_listings #this model is for users who joined a listing
  has_many :notifications, foreign_key: :recipient_id

  #assign each gender level to an integer
  enum gender: { "unknown" => 0, male: 1, female: 2, na: 9 } #if in symbol will also be converted to string

  #for photo uploading
  mount_uploaders :photos, PhotoUploader

  #for mailboxer
  acts_as_messageable

  def self.from_omniauth(auth)
    byebug
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[8,20]
      user.name = auth.info.name   # assuming the user model has a name
      # user.remote_photos_urls = auth.info.image.sub('http:','https:') # assuming the user model has an image
      #user.photos[0] = auth.info.image.to_json # assuming the user model has an image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def mailboxer_name
    self.name
  end

  def mailboxer_email(object)
    self.email
  end

end
