require "rails_helper"

RSpec.describe AirQualityFacade do
  it "returns the air quality for a given city", :vcr do
    air_quality = AirQualityFacade.new.air_quality("Abuja")
    
    expect(air_quality).to be_an(AirQuality)
    expect(air_quality.aqi).to eq(25)
    expect(air_quality.city).to eq("Abuja")
    expect(air_quality.id).to eq(nil)
    expect(air_quality.co_concentration).to eq(433.92)
    expect(air_quality.pm25_concentration).to eq(4.21)
  end
end