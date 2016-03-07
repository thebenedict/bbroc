class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :vendor

  validates :item, presence: true
  validates :vendor, presence: true
end
