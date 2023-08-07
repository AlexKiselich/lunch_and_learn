class AirQualityService
  def air_quality(city)
    get_url("/v1/airquality?city=#{city}")
  end


  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end


  def conn
    Faraday.new(url: "https://api.api-ninjas.com") do |f|
      f.headers["X-Api-Key"] = ENV["AIR_QUALITY_KEY"]
    end
  end
end