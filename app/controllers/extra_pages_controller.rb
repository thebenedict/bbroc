class ExtraPagesController < ApplicationController
  before_action :redirect_if_logged_in

  def home
    if params[:vendor_slug].present?
      @vendor = Vendor.find_by!(slug: params[:vendor_slug])
      render "vendor_home" 
    else
      @posts = Post.limit(10).sample(3)
    end
  end

  private

    def redirect_if_logged_in
      redirect_to posts_path if current_user
    end
end