require "rails_helper"

RSpec.describe "Favorites API" do
  describe "GET /api/v1/favorites?api_key=..." do
    describe "Happy Path"
    it "finds all the favorites of the User based on api_key" do
      user = User.create!(name: "Bilbo Baggins", email: "thetrueringmaster@email.com", password: "thereandbackagain", password_confirmation: "thereandbackagain", api_key: "fd1b4597c8497484027e4a321d33cd23")
      favorite1 = Favorite.create(recipe_title: "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
        recipe_link: "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
        country: "Thailand",
        user_id: user.id )

      favorite2 = Favorite.create(recipe_title: "Herb And White Wine Granita",
        recipe_link: "http://www.food52.com/recipes/351_herb_and_white_wine_granita",
        country: "France",
        user_id: user.id )


        get "/api/v1/favorites?api_key=fd1b4597c8497484027e4a321d33cd23"
        expect(response).to be_successful
        expect(response.status).to eq(200)

        json = JSON.parse(response.body, symbolize_names: true)

        expect(json).to be_a(Hash)
        expect(json).to have_key(:data)
        expect(json[:data]).to be_an(Array)
        expect(json[:data][0]).to have_key(:type)
        expect(json[:data][0][:type]).to eq("favorite")
        expect(json[:data][0]).to have_key(:attributes)
        expect(json[:data][0][:attributes]).to be_a(Hash)
        expect(json[:data][0][:attributes][:country]).to eq("Thailand")
        expect(json[:data][0][:attributes][:recipe_title]).to eq("Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
        expect(json[:data][1][:attributes][:country]).to eq("France")
        expect(json[:data][1][:attributes][:recipe_title]).to eq("Herb And White Wine Granita")
      end

      it "finds an empty array if a user does not have any favorites" do
        user = create(:user)

        get "/api/v1/favorites?api_key=#{user.api_key}"
        expect(response).to be_successful
        expect(response.status).to eq(200)

        json = JSON.parse(response.body, symbolize_names: true)

        expect(json).to be_a(Hash)
        expect(json).to have_key(:data)
        expect(json[:data]).to be_an(Array)
      end
    end

    describe "Sad Path" do
      it "Can not create a favorite for a user with invalid api key" do
        get "/api/v1/favorites?api_key=wrongapi"

        expect(response).to_not be_successful
        expect(response.status).to eq(400)

        json = JSON.parse(response.body, symbolize_names: true)

        expect(json).to be_a(Hash)
        expect(json).to have_key(:error)
        expect(json[:error]).to eq("Can't Find User")
      end
    end
end