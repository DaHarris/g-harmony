class Post < ActiveRecord::Base
  has_many :assignments, dependent: :destroy
  has_many :tags, through: :assignments
  has_many :likes
  before_save :timestamp

  def timestamp
    self.timestamp_field = DateTime.now
  end

end
