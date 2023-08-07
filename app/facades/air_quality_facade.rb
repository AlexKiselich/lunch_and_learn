class AirQualityFacade
  def air_quality(city)
    results = service.air_quality(city)
    AirQuality.new(results, city)
  end



  def service
    AirQualityService.new
  end
end