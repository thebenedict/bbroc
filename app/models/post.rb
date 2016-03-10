class Post < ActiveRecord::Base
  default_scope { order('created_at DESC') }

  belongs_to :user
  belongs_to :vendor

  validates :item, presence: true
  validates :vendor, presence: true

  has_attached_file :image, default_url: "/images/apples-placeholder.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def safe_item
    item.length <= 12 ? item : "#{item.first(12)}&hellip;".html_safe
  end
end
