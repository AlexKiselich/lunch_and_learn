require "rails_helper"

RSpec.describe "search for learning resources", type: :request do
  describe "happy paths" do
    it "returns a learning resource for a given country", :vcr do
      get "/api/v1/learning_resources?country=laos"

      expect(response).to be_successful

      learning_resource = JSON.parse(response.body, symbolize_names: true)

      expect(learning_resource).to be_a(Hash)
      expect(learning_resource).to have_key(:data)
      expect(learning_resource[:data][:id]).to eq(nil)
      expect(learning_resource[:data][:type]).to eq("learning_resources")
      expect(learning_resource[:data][:attributes]).to be_a(Hash)
      expect(learning_resource[:data][:attributes][:country]).to eq("laos")
      expect(learning_resource[:data][:attributes][:video]).to be_a(Hash)
      expect(learning_resource[:data][:attributes][:photos]).to be_an(Array)
      expect(learning_resource[:data][:attributes][:photos].count).to eq(10)
    end
  end

  describe "sad path" do
    it "returns an empty object if no videos or images are found", :vcr do
      get "/api/v1/learning_resources?country=324n32ifd2"

      expect(response).to be_successful

      learning_resource = JSON.parse(response.body, symbolize_names: true)
      
      expect(learning_resource).to be_a(Hash)
      expect(learning_resource).to have_key(:data)
      expect(learning_resource[:data][:id]).to eq(nil)
      expect(learning_resource[:data][:type]).to eq("learning_resources")
      expect(learning_resource[:data][:attributes]).to be_a(Hash)
      expect(learning_resource[:data][:attributes][:country]).to eq("324n32ifd2")
      expect(learning_resource[:data][:attributes][:video]).to eq({})
      expect(learning_resource[:data][:attributes][:photos]).to eq([])
    end
  end
end