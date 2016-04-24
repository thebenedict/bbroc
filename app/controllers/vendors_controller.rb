# == Schema Information
#
# Table name: vendors
#
#  id         :integer          not null, primary key
#  name       :string
#  lat        :float
#  lng        :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#  accuracy   :integer
#

class VendorsController < ApplicationController
  def index
    if params[:lat].present? and params[:lng].present?
      @vendors = Vendor.near([params[:lat], params[:lng]])
    else
      @vendors = Vendor.all.order('name')
    end
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(vendor_params)
    @vendor.user_submitted = true
    if @vendor.save
      flash.notice = "New vendor created!"
    else
      flash.notice = "The vendor could not be created because an error occurred." 
    end
    redirect_to new_vendor_path
  end

  private
    def vendor_params
      params.require(:vendor).permit(:name, :lat, :lng, :accuracy)
    end
end
