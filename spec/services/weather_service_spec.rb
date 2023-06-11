require 'rails_helper'

RSpec.describe 'Weather Service' do
  describe 'instance methods' do
    it 'returns weather data for a given location' do
      weather_service = WeatherService.new
      weather_results = weather_service.get_weather_data(39.738453, -104.984853)
      require 'pry'; binding.pry
    end
  end
end