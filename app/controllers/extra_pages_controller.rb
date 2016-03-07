class ExtraPagesController < ApplicationController
  def home
    @posts = Post.limit(10)
    render layout: 'bare', template: 'extra_pages/home'
  end
end