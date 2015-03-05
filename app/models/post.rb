class Post < ActiveRecord::Base
  has_many :assignments, dependent: :destroy
  has_many :tags, through: :assignments
  has_many :likes
  belongs_to :user
  before_save :timestamp

  validates :title, :description, presence: true
  validates :url, url: true

  validates :url, presence: true, if: ->(instance) { instance.code.blank? }
  validates :code, presence: true, if: ->(instance) { instance.url.blank? }

  def timestamp
    self.timestamp_field = DateTime.now
  end

end
