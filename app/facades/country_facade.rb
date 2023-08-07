class CountryFacade
  def random_country
    results = service.all_countries
    random_country = results.sample
    Country.new(random_country)
  end

  def get_capital(country)
    results = service.get_capital(country)
    data = results.first
    City.new(data)
  end

  def service
    CountryService.new
  end
end