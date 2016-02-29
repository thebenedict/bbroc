class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  belongs_to :vendor

  validates :item_id, uniqueness: { scope: [:user_id, :vendor_id] }
  validates :item, presence: true
  validates :vendor, presence: true
end
