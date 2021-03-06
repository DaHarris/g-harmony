class Tag < ActiveRecord::Base
  has_many :assignments
  has_many :posts, through: :assignments
  validates :title, uniqueness: true

end
