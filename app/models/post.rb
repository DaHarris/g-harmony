class Post < ActiveRecord::Base
  has_many :assignments
  has_many :tags, through: :assignments
  has_many :likes

end
