class Group < ActiveRecord::Base
  has_many :collections
  has_many :users, :through => :collections

  validates :topic, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
