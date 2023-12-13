require "rails_helper"

RSpec.describe "Find Markets", type: :feature do 
  describe "Form submitted" do 
    it "displays all markets" do 
      # As a visitor,
      # When I visit '/markets'
      # I see all markets listed with their name, city and state
      # When I click a button to see more info on that market
      # I'm taken to that market's show page '/markets/:id'

      #webmock stub
      json_response = File.read("spec/fixtures/markets/markets.json")

      stub_request(:get, "http://127.0.0.1:3000/api/v0/markets").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.12'
           }).
         to_return(status: 200, body: json_response, headers: {})
        # use postman to copy the api data into a fixture file 

         
      visit "/markets"
      expect(page).to have_content("Markets")
      expect(page).to have_content("Name")
      expect(page).to have_content("City")
      expect(page).to have_content("State")
    end

    it "can visit individual market's show page" do 
      json_response1 = File.read("spec/fixtures/markets/markets.json")
      stub_request(:get, "http://127.0.0.1:3000/api/v0/markets").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.12'
           }).
         to_return(status: 200, body: json_response1, headers: {}) 
      visit "/markets"

      json_response2 = File.read("spec/fixtures/markets/14&U_market.json")

      stub_request(:get, "http://127.0.0.1:3000/api/v0/markets/322458").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.12'
           }).
         to_return(status: 200, body: json_response2, headers: {})
         
      visit "/markets"
      first('button', text: 'More Info').click
      expect(page).to have_content("14&U Farmers' Market")
      expect(page).to have_content("1400 U Street NW")
      expect(page).to have_content("Washington")
      expect(page).to have_content("District of Columbia")
      expect(page).to have_content("20009")
      expect(page).to have_content("Vendors at our Market")
    end
  end
end