class ExtraPagesController < ApplicationController
  before_action :redirect_if_logged_in

  def home
    if params[:vendor_slug].present?
      @vendor = Vendor.find_by!(slug: params[:vendor_slug])
      @request = Request.new
      render "vendor_home"
    else
      @posts = Post.limit(24)
    end
  end

  private

    def redirect_if_logged_in
      if current_user and params[:vendor_slug].blank?
        redirect_to posts_path
      end
    end
end
