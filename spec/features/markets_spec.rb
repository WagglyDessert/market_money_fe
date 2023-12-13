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
      # expect(page).to have_content("City")
      # expect(page).to have_content("State")
      
    end
  end
end