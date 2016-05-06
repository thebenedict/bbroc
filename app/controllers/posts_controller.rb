# == Schema Information
#
# Table name: posts
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  vendor_id          :integer
#  item               :string
#  notes              :string
#  price              :integer
#  unit               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  fresh_report_id    :integer
#

class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @request = Request.new
    @posts = Post.order(created_at: :desc).page(params[:page])
  end

  def new
    @legacy = params[:legacy]
    @post = Post.new
    @post.build_vendor
  end

  def create
    image = Paperclip.io_adapters.for(post_params[:image]) 
    image.original_filename = "#{post_params[:item].parameterize}.jpg"
    named_params = post_params
    named_params[:image] = image
    post = current_user.posts.build(named_params)
    if post.vendor.new_record?
      post.vendor.user_submitted = true
    end
    if post.save
      flash.notice = "Success, thanks for posting!"
    else
      flash.alert = "Something went wrong, please try again."
    end
    redirect_to new_post_path
  end

  private

    def post_params
      params.require(:post).permit(:item, :vendor_id, :notes, :price, :unit, 
        :image, :image_field, vendor_attributes: [:name, :lat, :lng, :accuracy])
    end
end
