class Vendor < ActiveRecord::Base
  validates :name, uniqueness: true
end
