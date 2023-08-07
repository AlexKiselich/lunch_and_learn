require "rails_helper"

RSpec.describe "search air quality", type: :request do
  describe "happy paths" do
    it "returns the air_quality for a given country", :vcr do
      get "/api/v1/air_quality?country=France"

      expect(response).to be_successful

      air_quality = JSON.parse(response.body, symbolize_names: true)

      expect(air_quality).to be_a(Hash)
      expect(air_quality).to have_key(:data)
      expect(air_quality[:data]).to be_a(Hash)
      expect(air_quality[:data]).to have_key(:id)
      expect(air_quality[:data][:id]).to be(nil)
      expect(air_quality[:data]).to have_key(:type)
      expect(air_quality[:data][:type]).to eq("air_quality")
      expect(air_quality[:data]).to have_key(:attributes)
      expect(air_quality[:data][:attributes]).to be_a(Hash)
      expect(air_quality[:data][:attributes]).to have_key(:aqi)
      expect(air_quality[:data][:attributes][:aqi]).to eq(66)
      expect(air_quality[:data][:attributes]).to have_key(:pm25_concentration)
      expect(air_quality[:data][:attributes][:pm25_concentration]).to eq(3.13)
      expect(air_quality[:data][:attributes]).to have_key(:city)
      expect(air_quality[:data][:attributes][:city]).to be_a(String)
      expect(air_quality[:data][:attributes][:city]).to eq("Paris")
      expect(air_quality[:data][:attributes]).to have_key(:co_concentration)
      expect(air_quality[:data][:attributes][:co_concentration]).to eq(226.97)
    end
  end
end