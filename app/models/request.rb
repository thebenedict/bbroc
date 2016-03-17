class Request < ActiveRecord::Base
  belongs_to :user
  has_many :matches
  has_many :posts, through: :matches

  accepts_nested_attributes_for :matches

  after_create :notify_admins

  def notify_admins
    RequestMailer.new_request_email(self).deliver_later
  end
end
