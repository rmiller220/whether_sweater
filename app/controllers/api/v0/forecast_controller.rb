class Api::V0::ForecastController < ApplicationController
  def index
    if params[:location].nil?
      render json: {error: "Please provide a city name"}, status: 400
    else
      forecast = WeatherFacade.new.get_weather_data(params[:location])
      render json: ForecastSerializer.new(forecast)
    end
  end 
end