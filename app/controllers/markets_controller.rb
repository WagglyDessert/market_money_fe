class MarketsController < ApplicationController
  
  def index
    @facade = MarketsFacade.new.all_markets
  end

  def show
    market_id = params[:id]
    @facade = MarketsFacade.new.single_market(market_id)
    # to get vendors for the market
    vendor_response = Faraday.get("http://127.0.0.1:3000/api/v0/markets/#{market_id}/vendors")
    @vendor_data = JSON.parse(vendor_response.body, symbolize_names: true)
  end
  
end