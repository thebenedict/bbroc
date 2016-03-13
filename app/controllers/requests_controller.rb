class RequestsController < ApplicationController
  def create
    request = current_user.requests.create(request_params)
    flash.notice = "We'll let you know what we hear about #{request.body.downcase}"
    redirect_to :posts
  end

  private
    def request_params
      params.require(:request).permit(:body)
    end
end
