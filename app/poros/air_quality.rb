class AirQuality
  attr_reader :id,
              :city,
              :aqi,
              :pm25_concentration,
              :co_concentration

  def initialize(data, city)
    @id = nil
    @city = city
    @aqi = data[:overall_aqi]
    @pm25_concentration = data[:"PM2.5"][:concentration]
    @co_concentration = data[:CO][:concentration]
  end
end