class RequestsController < ApplicationController
  before_filter :verify_admin, only: :send_fulfillment_notifications

  def create
    request = current_user.requests.create(request_params)
    flash.notice = "We'll let you know what we hear about #{request.body.downcase}"
    redirect_to :posts
  end

  def send_fulfillment_notifications
    count = Request.pending.count
    if count > 0
      Request.send_fulfillment_notifications
      flash.notice = "Sent #{count} notifications!"
    else
      flash.notice = "No notifications to send"
    end
    redirect_to admin_requests_path
  end

  private
    def request_params
      params.require(:request).permit(:body)
    end

    def verify_admin
      redirect_to root_path unless current_user and current_user.role == "admin"
    end
end
