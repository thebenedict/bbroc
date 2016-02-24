class ReportsController < ApplicationController
  def index
    # preserve form state details if user sign up fails
    @resource = User.new(session[:incomplete_resource])
  end
end
