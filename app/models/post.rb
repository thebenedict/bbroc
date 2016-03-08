class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :vendor

  validates :item, presence: true
  validates :vendor, presence: true

  has_attached_file :image, default_url: "apples-placeholder"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def safe_post_item
    self.item.name.split(" ")[0]
  end

end
