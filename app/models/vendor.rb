# == Schema Information
#
# Table name: vendors
#
#  id         :integer          not null, primary key
#  name       :string
#  lat        :float
#  lng        :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#  accuracy   :integer
#

class Vendor < ActiveRecord::Base
  validates :name, presence: true

  has_many :posts
  has_many :users

  before_save :generate_slug

  geocoded_by :address, :latitude  => :lat, :longitude => :lng

  def map_url
    "https://maps.google.com/?q=#{self.lat},#{self.lng}"
  end

  def generate_slug
    self.slug ||= self.name.parameterize
  end

  def vendor_url
    "/vendors/"+"#{self.slug}"
  end

end
