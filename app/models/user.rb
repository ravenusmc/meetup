class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :collections 
  has_many :groups, :through => :collections

  validates :email, presence: true
  validates :username, presence: true

  geocoded_by :address
  after_validation :geocode
end
