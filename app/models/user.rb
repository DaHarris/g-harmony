class User < ActiveRecord::Base

  has_secure_password
  has_many :likes
  has_many :posts

  validates_presence_of :first_name, :last_name, :username
  validates_uniqueness_of :username


end
