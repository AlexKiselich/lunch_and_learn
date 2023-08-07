class Api::V1::AirQualityController < ApplicationController
  def index
    city = CountryFacade.new.get_capital(params[:country])
    air_quality = AirQualityFacade.new.air_quality(city.name)
    render json: AirQualitySerializer.new(air_quality)
  end
end