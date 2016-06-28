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

  def has_group_access?(group_id)
    Collection.find_by_group_id_and_user_id(group_id, self.id)
  end
end
