class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
    # preserve form state details if user sign up fails
    @resource = User.new(session[:incomplete_resource])
    @posts = Post.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.build(post_params.except(:image_field))
    if post.save
      flash.notice = "Success, thanks for posting!"
    else
      flash.alert = "Something went wrong, please try again."
    end
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:item, :vendor_id, :notes, :price, :unit, :image, :image_field)
  end
end
