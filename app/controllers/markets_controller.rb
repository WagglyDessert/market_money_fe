class MarketsController < ApplicationController
  
  def index
    # state_code =  params[:state]
    # @facade = ParksFacade.new.parks_per_state(state_code)

    #SERVICE---------------------------------------------------------------

    #faraday connection
     response = Faraday.get("http://127.0.0.1:3000/api/v0/markets")
    #make api call to endpoint
    #don't need to include the "api_key={key}" because faraday params will find it for us

    #run test here; webmock will have an error message. need to stub request for webmock
    #response = ParkService.new.parks_per_state(state_code)

    #FACADE---------------------------------------------------------------

    #make json data from response
    @data = JSON.parse(response.body, symbolize_names: true)
    #require 'pry'; binding.pry
    #send back requested information
  end

  def show
    market_id = params[:id]
    response = Faraday.get("http://127.0.0.1:3000/api/v0/markets/#{market_id}")
    @data = JSON.parse(response.body, symbolize_names: true)
  end
  
end