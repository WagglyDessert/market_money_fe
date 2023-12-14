class MarketService 
  def conn
    conn = Faraday.new("http://localhost:3000")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def all_markets
    get_url("/api/v0/markets")
  end

  def single_market(id)
    get_url("/api/v0/markets/#{id}")
  end

  def market_vendors(id)
    get_url("/api/v0/markets/#{id}/vendors")
  end
end