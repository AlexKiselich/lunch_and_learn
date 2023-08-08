require "rails_helper"

RSpec.describe "search recipes", type: :request do
  describe "happy paths" do
    it "returns a list of recipes for a given country", :vcr do
      get "/api/v1/recipes?country=thailand"

      expect(response).to be_successful

      recipes = JSON.parse(response.body, symbolize_names: true)

      expect(recipes).to be_a(Hash)
      expect(recipes).to have_key(:data)
      expect(recipes[:data]).to be_an(Array)
      expect(recipes[:data].first).to have_key(:id)
      expect(recipes[:data].first[:id]).to be(nil)
      expect(recipes[:data].first).to have_key(:type)
      expect(recipes[:data].first[:type]).to eq("recipe")
      expect(recipes[:data].first).to have_key(:attributes)
      expect(recipes[:data].first[:attributes]).to be_a(Hash)
      expect(recipes[:data].first[:attributes]).to have_key(:title)
      expect(recipes[:data].first[:attributes][:title]).to be_a(String)
      expect(recipes[:data].first[:attributes]).to have_key(:url)
      expect(recipes[:data].first[:attributes][:url]).to be_a(String)
      expect(recipes[:data].first[:attributes]).to have_key(:country)
      expect(recipes[:data].first[:attributes][:country]).to be_a(String)
      expect(recipes[:data].first[:attributes][:country]).to eq("thailand")
      expect(recipes[:data].first[:attributes]).to have_key(:image)
      expect(recipes[:data].first[:attributes][:image]).to be_a(String)

      expect(recipes[:data].first[:attributes]).to_not have_key(:healthLabels)
      expect(recipes[:data].first[:attributes]).to_not have_key(:cuisineType)
      expect(recipes[:data].first[:attributes]).to_not have_key(:ingredients)
    end

    it "returns a list of a recipes from a random country", :vcr do
      get "/api/v1/recipes"

      expect(response).to be_successful

      recipes = JSON.parse(response.body, symbolize_names: true)
      
      expect(recipes).to be_a(Hash)
      expect(recipes).to have_key(:data)
      expect(recipes[:data]).to be_an(Array)
      expect(recipes[:data].first).to have_key(:id)
      expect(recipes[:data].first[:id]).to be(nil)
      expect(recipes[:data].first).to have_key(:type)
      expect(recipes[:data].first[:type]).to eq("recipe")
      expect(recipes[:data].first).to have_key(:attributes)
      expect(recipes[:data].first[:attributes]).to be_a(Hash)
      expect(recipes[:data].first[:attributes]).to have_key(:title)
      expect(recipes[:data].first[:attributes][:title]).to be_a(String)
      expect(recipes[:data].first[:attributes]).to have_key(:url)
      expect(recipes[:data].first[:attributes][:url]).to be_a(String)
      expect(recipes[:data].first[:attributes]).to have_key(:country)
      expect(recipes[:data].first[:attributes][:country]).to be_a(String)
      expect(recipes[:data].first[:attributes]).to have_key(:image)
      expect(recipes[:data].first[:attributes][:image]).to be_a(String)

      expect(recipes[:data].first[:attributes]).to_not have_key(:healthLabels)
      expect(recipes[:data].first[:attributes]).to_not have_key(:cuisineType)
      expect(recipes[:data].first[:attributes]).to_not have_key(:ingredients)
    end
  end

  describe "sad path" do
    it "returns an empty array if the country being searched for is an empty string", :vcr do
      get "/api/v1/recipes?country=''"

      expect(response).to be_successful

      response_body = JSON.parse(response.body, symbolize_names: true)
      expect(response_body).to be_a(Hash)
      expect(response_body).to have_key(:data)
      expect(response_body[:data]).to eq([])
    end

    it "returns an empty array if the country being searched for is a value that doesn’t return any recipes", :vcr do
      get "/api/v1/recipes?country=babsfds"

      expect(response).to be_successful

      response_body = JSON.parse(response.body, symbolize_names: true)
      expect(response_body).to be_a(Hash)
      expect(response_body).to have_key(:data)
      expect(response_body[:data]).to eq([])
    end
  end
end