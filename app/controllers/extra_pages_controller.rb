class ExtraPagesController < ApplicationController
  before_action :redirect_if_logged_in

  def home
    @posts = Post.limit(3)
  end

  private

    def redirect_if_logged_in
      redirect_to posts_path if current_user
    end
end
