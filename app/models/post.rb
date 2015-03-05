class Post < ActiveRecord::Base

  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(:hard_wrap => true, :escape_html => true), :autolink => true, :space_after_headers => true)
  before_save { |post| post.code = markdown.render(post.code) }

  has_many :assignments, dependent: :destroy
  has_many :tags, through: :assignments
  has_many :likes
  belongs_to :user
  before_save :timestamp

  validates :title, :description, presence: true
  
  validates :url, presence: true, url: true, if: ->(instance) { instance.code.blank? }
  validates :code, presence: true, if: ->(instance) { instance.url.blank? }

  def timestamp
    self.timestamp_field = DateTime.now
  end
end
