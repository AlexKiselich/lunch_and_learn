require "rails_helper"

RSpec.describe AirQuality do
  it "exists and has attributes" do
    data = {
      :id => nil,
      :overall_aqi => 24,
      :"PM2.5" => 4,
      :CO => 410.46
    }

    air_quality = AirQuality.new(data, "Abjua")
    # expect(air_quality).to be_a(AirQuality)
    # expect(air_quality.id).to eq(nil)
    # expect(air_quality.aqi).to eq(24)
    # expect(air_quality.pm25_concentration).to eq(4)
    # expect(air_quality.co_concentration).to eq(410.46)
    # expect(air_quality.city).to eq("Abjua")
  end
end