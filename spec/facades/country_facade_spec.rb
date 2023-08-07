require "rails_helper"

RSpec.describe CountryFacade do
  it "returns a random country", :vcr do
    country = CountryFacade.new.random_country

    expect(country).to be_a(Country)
    expect(country.name).to be_a(String)
  end

  it "returns a city from a country", :vcr do
    city = CountryFacade.new.get_capital("France")

    expect(city).to be_a(City)
    expect(city.name).to be_a(String)
  end
end