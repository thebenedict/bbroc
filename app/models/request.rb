class Request < ActiveRecord::Base
  belongs_to :user

  after_create :notify_admins

  def notify_admins
    RequestMailer.new_request_email(self).deliver_later
  end
end
