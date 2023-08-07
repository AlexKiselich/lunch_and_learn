require "rails_helper"

RSpec.describe "search air quality", type: :request do
  describe "happy paths" do
    it "returns the air_quality for a given country", :vcr do
      get "/api/v1/air_quality?country=France"

      expect(response).to be_successful


      # expect(recipes).to be_a(Hash)
      # expect(recipes).to have_key(:data)
      # expect(recipes[:data]).to be_an(Array)
      # expect(recipes[:data].first).to have_key(:id)
      # expect(recipes[:data].first[:id]).to be(nil)
      # expect(recipes[:data].first).to have_key(:type)
      # expect(recipes[:data].first[:type]).to eq("recipe")
      # expect(recipes[:data].first).to have_key(:attributes)
      # expect(recipes[:data].first[:attributes]).to be_a(Hash)
      # expect(recipes[:data].first[:attributes]).to have_key(:title)
      # expect(recipes[:data].first[:attributes][:title]).to be_a(String)
      # expect(recipes[:data].first[:attributes]).to have_key(:url)
      # expect(recipes[:data].first[:attributes][:url]).to be_a(String)
      # expect(recipes[:data].first[:attributes]).to have_key(:country)
      # expect(recipes[:data].first[:attributes][:country]).to be_a(String)
      # expect(recipes[:data].first[:attributes][:country]).to eq("thailand")
      # expect(recipes[:data].first[:attributes]).to have_key(:image)
      # expect(recipes[:data].first[:attributes][:image]).to be_a(String)

      # expect(recipes[:data].first[:attributes]).to_not have_key(:healthLabels)
      # expect(recipes[:data].first[:attributes]).to_not have_key(:cuisineType)
      # expect(recipes[:data].first[:attributes]).to_not have_key(:ingredients)
    end
  end
end