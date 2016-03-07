class ExtraPagesController < ApplicationController
  def home
    @posts = Post.limit(10)
  end
end
