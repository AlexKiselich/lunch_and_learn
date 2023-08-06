require "rails_helper"

RSpec.describe "country service" do
  it "selects all countries", :vcr do
    countries = CountryService.new.all_countries
    country_1 = countries.first

    expect(countries).to be_a(Array)
    expect(countries.count).to eq(250)
    
    expect(country_1).to have_key(:name)
    expect(country_1[:name]).to be_a(Hash)
    expect(country_1[:name]).to have_key(:common)
    expect(country_1[:name][:common]).to be_a(String)
  end
end