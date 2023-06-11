class Weather
  attr_reader :current_weather,
              :daily_weather,
              :hourly_weather,
              :id,
              :type
  def initialize(current_weather, daily_weather, hourly_weather)
    @id = 'null'
    @type = 'forecast'
    @current_weather = current_weather
    @daily_weather = daily_weather
    @hourly_weather = hourly_weather
  end
end