require 'rails_helper'

RSpec.describe 'Weather Service' do
  describe 'instance methods' do
    it 'returns current weather data for a given location' do
      weather_service = WeatherService.new
      weather_results = weather_service.get_weather_data(39.738453, -104.984853)

      expect(weather_results).to be_a(Hash)
      expect(weather_results).to have_key(:current)
      expect(weather_results[:current]).to be_a(Hash)
      expect(weather_results[:current]).to have_key(:last_updated)
      expect(weather_results[:current][:last_updated]).to be_a(String)
      expect(weather_results[:current]).to have_key(:temp_f)
      expect(weather_results[:current][:temp_f]).to be_a(Float)
      expect(weather_results[:current]).to have_key(:condition)
      expect(weather_results[:current][:condition]).to be_a(Hash)
      expect(weather_results[:current][:condition]).to have_key(:text)
      expect(weather_results[:current][:condition][:text]).to be_a(String)
      expect(weather_results[:current][:condition]).to have_key(:icon)
      expect(weather_results[:current][:condition][:icon]).to be_a(String)
      expect(weather_results[:current]).to have_key(:feelslike_f)
      expect(weather_results[:current][:feelslike_f]).to be_a(Float)
      expect(weather_results[:current]).to have_key(:humidity)
      expect(weather_results[:current][:humidity]).to be_a(Integer)
      expect(weather_results[:current]).to have_key(:vis_miles)
      expect(weather_results[:current][:vis_miles]).to be_a(Float)
      expect(weather_results[:current]).to have_key(:uv)
      expect(weather_results[:current][:uv]).to be_a(Float)
    end

    it 'returns forecast weather data for a given location' do
      weather_service = WeatherService.new
      weather_results = weather_service.get_weather_data(39.738453, -104.984853)

      expect(weather_results).to have_key(:forecast)
      expect(weather_results[:forecast]).to be_a(Hash)
      expect(weather_results[:forecast]).to have_key(:forecastday)
      expect(weather_results[:forecast][:forecastday]).to be_an(Array)
      weather_results[:forecast][:forecastday].each do |day|
        expect(day).to have_key(:date)
        expect(day[:date]).to be_a(String)
        expect(day).to have_key(:day)
        expect(day[:day]).to be_a(Hash)
        expect(day[:day]).to have_key(:maxtemp_f)
        expect(day[:day][:maxtemp_f]).to be_a(Float)
        expect(day[:day]).to have_key(:mintemp_f)
        expect(day[:day][:mintemp_f]).to be_a(Float)
        expect(day[:day]).to have_key(:condition)
        expect(day[:day][:condition]).to be_a(Hash)
        expect(day[:day][:condition]).to have_key(:text)
        expect(day[:day][:condition][:text]).to be_a(String)
        expect(day[:day][:condition]).to have_key(:icon)
        expect(day[:day][:condition][:icon]).to be_a(String)
        expect(day).to have_key(:astro)
        expect(day[:astro]).to be_a(Hash)
        expect(day[:astro]).to have_key(:sunrise)
        expect(day[:astro][:sunrise]).to be_a(String)
        expect(day[:astro]).to have_key(:sunset)
        expect(day[:astro][:sunset]).to be_a(String)
      end
    end
    it 'returns hourly weather data for a given location' do
      weather_service = WeatherService.new
      weather_results = weather_service.get_weather_data(39.738453, -104.984853)

      expect(weather_results).to have_key(:forecast)
      expect(weather_results[:forecast]).to be_a(Hash)
      expect(weather_results[:forecast]).to have_key(:forecastday)
      expect(weather_results[:forecast][:forecastday]).to be_an(Array)
      weather_results[:forecast][:forecastday].each do |day|
        expect(day).to have_key(:hour)
        expect(day[:hour]).to be_an(Array)
        expect(day[:hour].count).to eq(24)
        day[:hour].each do |hour|
          expect(hour).to have_key(:time)
          expect(hour[:time]).to be_a(String)
          expect(hour).to have_key(:temp_f)
          expect(hour[:temp_f]).to be_a(Float)
          expect(hour).to have_key(:condition)
          expect(hour[:condition]).to be_a(Hash)
          expect(hour[:condition]).to have_key(:text)
          expect(hour[:condition][:text]).to be_a(String)
          expect(hour[:condition]).to have_key(:icon)
          expect(hour[:condition][:icon]).to be_a(String)
        end
      end
    end
  end
end