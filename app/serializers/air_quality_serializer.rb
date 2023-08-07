class AirQualitySerializer
  include JSONAPI::Serializer
  attributes :aqi, :city, :pm25_concentration, :co_concentration
end
