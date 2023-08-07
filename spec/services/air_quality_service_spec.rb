require "rails_helper"

RSpec.describe AirQualityService do
  it "gives the air quality of a city", :vcr do
    city = AirQualityService.new.air_quality("Abuja")
    expect(city).to be_a(Hash)

    expect(city).to have_key(:CO)
    expect(city[:CO]).to be_a(Hash)
    expect(city).to have_key(:overall_aqi)
    expect(city[:overall_aqi]).to eq(25)
  end
end