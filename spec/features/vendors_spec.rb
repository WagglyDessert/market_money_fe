require "rails_helper"

RSpec.describe "Find Markets", type: :feature do 
  describe "Form submitted" do 
    it "can visit individual market's show page" do 
      json_response = File.read("spec/fixtures/vendors/charcuterie_corner.json")
      stub_request(:get, "http://127.0.0.1:3000/api/v0/vendors/55823").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.12'
           }).
         to_return(status: 200, body: json_response, headers: {})

      visit "/vendors/55823"
         
      expect(page).to have_content("The Charcuterie Corner")
      expect(page).to have_content("Contact Info")
      expect(page).to have_content("Claudie Langworth III")
      expect(page).to have_content("1-147-179-9747")
      expect(page).to have_content("false")
      expect(page).to have_content("Vendor selling a variety of artisanal cured meats and sausages.")
    end
  end
end