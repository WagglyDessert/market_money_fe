class VendorsController < ApplicationController

  def show
    vendor_id = params[:id]
    @facade = VendorsFacade.new.single_vendor(vendor_id)
  end
  
end