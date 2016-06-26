class Comment < ActiveRecord::Base
  belongs_to :group 

  validates :author, presence: true 

end
