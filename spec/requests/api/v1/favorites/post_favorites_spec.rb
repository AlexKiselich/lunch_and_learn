require "rails_helper"

RSpec.describe "Favorites API" do
  describe "POST /api/v1/favorites" do
    describe "Happy Path"
      before :each do
        User.create!(name: "Bilbo Baggins", email: "thetrueringmaster@email.com", password: "thereandbackagain", password_confirmation: "thereandbackagain", api_key: "fd1b4597c8497484027e4a321d33cd23")
      end
      it "creates a favorite for a user" do

        fav_params = {
                      "api_key": "fd1b4597c8497484027e4a321d33cd23",
                      "country": "thailand",
                      "recipe_link": "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
                      "recipe_title": "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)"
                      }

        headers = { "CONTENT_TYPE" => "application/json" }
        post "/api/v1/favorites", headers: headers, params: JSON.generate(fav_params)
        expect(response).to be_successful
        expect(response.status).to eq(201)

        json = JSON.parse(response.body, symbolize_names: true)

        expect(json).to be_a(Hash)
        expect(json).to have_key(:success)
        expect(json[:success]).to eq("Favorite added successfully")
      end
    end

    describe "Sad Path" do
        before :each do
          User.create!(name: "Bilbo Baggins", email: "theotherringmaster@email.com", password: "thereandbackagain", password_confirmation: "thereandbackagain", api_key: "fd1b4597c8497484027e4a321d33cd23")
        end
      it "Can not create a favorite for a user with invalid api key" do

        fav_params = {
                      "api_key": "wrong",
                      "country": "thailand",
                      "recipe_link": "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
                      "recipe_title": "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)"
                      }

        headers = { "CONTENT_TYPE" => "application/json" }
        post "/api/v1/favorites", headers: headers, params: JSON.generate(fav_params)
        expect(response).to_not be_successful
        expect(response.status).to eq(400)

        json = JSON.parse(response.body, symbolize_names: true)

        expect(json).to be_a(Hash)
        expect(json).to have_key(:error)
        expect(json[:error]).to eq("Can't Find User")
      end
    end
end