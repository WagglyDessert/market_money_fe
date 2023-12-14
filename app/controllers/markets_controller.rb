class MarketsController < ApplicationController
  
  def index
    @facade = MarketsFacade.new.all_markets
  end

  def show
    market_id = params[:id]
    @facade = MarketsFacade.new.single_market(market_id)
    # to get vendors for the market
    @vendor_facade = MarketsFacade.new.market_vendors(market_id)
  end
  
end