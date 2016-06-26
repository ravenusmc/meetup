class Group < ActiveRecord::Base
  has_many :collections
  has_many :comments 
  has_many :users, :through => :collections

  validates :topic, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  geocoded_by :address
  after_validation :geocode
end
