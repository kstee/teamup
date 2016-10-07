class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

  enum gender: { "unknown" => 0, male: 1, female: 2, na: 9 } #if in symbol will also be converted to string
  mount_uploaders :photos, PhotoUploader

  has_many :user_activity
  has_many :listings, dependent: :destroy
  has_many :activities, through: :user_activity, dependent: :destroy

end
