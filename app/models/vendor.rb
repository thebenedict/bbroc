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
#

class Vendor < ActiveRecord::Base
  validates :name, presence: true

  has_many :posts
  has_many :users

  def map_url
    "https://maps.google.com/?q=#{self.lat},#{self.lng}"
  end
end
