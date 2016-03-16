class PostsController < ApplicationController
  before_action :authenticate_user!
  before_filter :verify_post_permission, only: :new

  def index
    @request = Request.new
    @posts = Post.order(created_at: :desc).page(params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    image = Paperclip.io_adapters.for(post_params[:image]) 
    image.original_filename = "#{post_params[:item].parameterize}.jpg"
    named_params = post_params
    named_params[:image] = image
    post = current_user.posts.build(named_params)
    if post.save
      flash.notice = "Success, thanks for posting!"
    else
      flash.alert = "Something went wrong, please try again."
    end
    redirect_to new_post_path
  end

  private

    def post_params
      params.require(:post).permit(:item, :vendor_id, :notes, :price, :unit, :image, :image_field)
    end

    def verify_post_permission
      redirect_to root_path unless current_user and current_user.role != "user"
    end
end
