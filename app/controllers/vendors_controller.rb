class VendorsController < ApplicationController

  def show
    vendor_id = params[:id]
    response = Faraday.get("http://127.0.0.1:3000/api/v0/vendors/#{vendor_id}")
    @data = JSON.parse(response.body, symbolize_names: true)
  end
  
end