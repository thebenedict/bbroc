class Vendor < ActiveRecord::Base
  validates :name, presence: true

  has_many :posts

  def map_url
    "https://maps.google.com/?q=#{self.lat},#{self.lng}"
  end
end
