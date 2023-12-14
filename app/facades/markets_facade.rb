class MarketsFacade

  def initialize
    @service = MarketService.new
  end

  def all_markets
    response = @service.all_markets
    #require 'pry'; binding.pry
    #data = JSON.parse(response.body, symbolize_names: true)

    response[:data].map do |d|
      Market.new(d)
    end
  end

  def single_market(id)
    response = @service.single_market(id)
    data = [response[:data]]

    data.map do |d|
      Market.new(d)
    end
  end

end