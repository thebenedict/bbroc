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
#  fresh_report_id    :integer
#

class Post < ActiveRecord::Base
  UNITS_CHOICES = YAML.load_file("#{Rails.root}/config/data/choices.yml")["UNITS"]

  default_scope { order('created_at DESC') }

  belongs_to :user
  belongs_to :vendor
  has_many :matches
  has_many :requests, through: :matches
  has_many :requestors, through: :requests, class_name: "User", source: :user

  validates :item, presence: true
  validates :vendor, presence: true

  has_attached_file :image, styles: { standard: "610x458>" }, default_url: "/apples-placeholder.jpg", :s3_protocol => :https

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  accepts_nested_attributes_for :vendor, limit: 1, reject_if: proc { |attributes| attributes['name'].blank? }

  def safe_item
    item.length <= 16 ? item : "#{item.first(16).strip}&hellip;".html_safe
  end

  def price_string
    "Tsh #{self.price} #{self.unit}"
  end

  def badge_text_for(current_user)
    if self.matches.present? and self.requestors.present?
      "requested by " + "#{self.requestor_name(current_user).capitalize}"
    elsif self.requestors.present?
      "requested"
    else
      ""
    end
  end

  def badge_class
    if self.matches.present?
      "requested-by"
    else
      ""
    end
  end

  def requestor_name(current_user)
    if self.requestors.include? current_user
      "you"
    else
      self.requestors.first.first_name
    end
  end

end
