class CountryFacade
  def random_country
    results = service.all_countries
    random_country = results.sample
    Country.new(random_country)
  end

  def service
    CountryService.new
  end
end