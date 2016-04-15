# == Schema Information
#
# Table name: posts
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  vendor_id          :integer
#  item               :string
#  notes              :string
#  price              :integer
#  unit               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Post < ActiveRecord::Base
  default_scope { order('created_at DESC') }

  belongs_to :user
  belongs_to :vendor
  has_many :matches
  has_many :requests, through: :matches

  validates :item, presence: true
  validates :vendor, presence: true

  if Rails.env.production?
    has_attached_file :image, default_url: "/public/apples-placeholder.jpg", :s3_protocol => :https
  else
    has_attached_file :image, default_url: "/apples-placeholder.jpg", :s3_protocol => :https
  end

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def safe_item
    item.length <= 16 ? item : "#{item.first(16).strip}&hellip;".html_safe
  end

  def price_string
    "Tsh #{self.price} #{self.unit}"
  end
end
