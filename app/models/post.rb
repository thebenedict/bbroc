class Post < ActiveRecord::Base
  belongs_to :item
  belongs_to :vendor

  validates :item_id, uniqueness: { scope: [:user_id, :vendor_id] }
end
