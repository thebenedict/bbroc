# == Schema Information
#
# Table name: requests
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  body        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  notified_at :datetime
#  status      :integer
#

class Request < ActiveRecord::Base
  scope :pending, -> { includes(:matches).where(notified_at: nil).where.not(matches: { id: nil }) }

  validates :body, presence: true

  belongs_to :user
  has_many :matches
  has_many :posts, through: :matches

  accepts_nested_attributes_for :matches

  after_create :notify_admins, :send_user_confirmation
  before_save :update_status, :clean_body

  enum status: {
    fresh: 0,
    pending: 1,
    resolved: 2,
    blank: 9
  }

  def notify_admins
    RequestMailer.new_request_email(self).deliver_later
  end

  def send_user_confirmation
    RequestMailer.request_confirmation_email(self).deliver_later
  end

  def update_status
    if self.matches.present? and notified_at.blank?
      self.status = "pending"
    elsif self.matches.present?
      self.status = "resolved"
    elsif self.body.blank? 
      self.status = "blank"
    else
      self.status = "fresh"
    end
  end

  def clean_body
    self.body = self.body.strip if self.body.present?
  end

  def self.send_fulfillment_notifications
    Request.pending.each do |r|
      RequestMailer.matches_email(r).deliver_later
      r.update(notified_at: DateTime.now)
    end
  end
end
