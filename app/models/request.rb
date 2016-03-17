class Request < ActiveRecord::Base
  scope :pending, -> { includes(:matches).where(notified_at: nil).where.not(matches: { id: nil }) }

  belongs_to :user
  has_many :matches
  has_many :posts, through: :matches

  accepts_nested_attributes_for :matches

  after_create :notify_admins

  def notify_admins
    RequestMailer.new_request_email(self).deliver_later
  end
end
