class Post < ActiveRecord::Base
  default_scope { order('created_at DESC') }

  belongs_to :user
  belongs_to :vendor

  validates :item, presence: true
  validates :vendor, presence: true

  if Rails.env.production?
    has_attached_file :image, default_url: "/public/apples-placeholder.jpg"
  else
    has_attached_file :image, default_url: "/apples-placeholder.jpg"
  end

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def safe_item
    item.length <= 16 ? item : "#{item.first(16).strip}&hellip;".html_safe
  end
end
