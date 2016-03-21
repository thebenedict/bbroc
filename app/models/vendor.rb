class Vendor < ActiveRecord::Base
  validates :name

  has_many :posts

  def map_url
    "https://maps.google.com/?q=#{self.lat},#{self.lng}"
  end
end
