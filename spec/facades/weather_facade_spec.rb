require 'rails_helper'

RSpec.describe 'Weather Facade' do
  describe 'instance methods' do
    it 'returns current weather for a given location' do
      location = "denver,co"
      weather_data = WeatherFacade.new.get_weather_data(location)

      expect(weather_data).to be_a(Weather)
      expect(weather_data.id).to eq('null')
      expect(weather_data.type).to eq('forecast')
      expect(weather_data.current_weather).to be_a(Hash)
      expect(weather_data.current_weather).to have_key(:last_updated)
      expect(weather_data.current_weather[:last_updated]).to be_a(String)
      expect(weather_data.current_weather).to have_key(:temp_f)
      expect(weather_data.current_weather[:temp_f]).to be_a(Float)
      expect(weather_data.current_weather).to have_key(:condition_text)
      expect(weather_data.current_weather[:condition_text]).to be_a(String)
      expect(weather_data.current_weather).to have_key(:icon)
      expect(weather_data.current_weather[:icon]).to be_a(String)
      expect(weather_data.current_weather).to have_key(:feelslike_f)
      expect(weather_data.current_weather[:feelslike_f]).to be_a(Float)
      expect(weather_data.current_weather).to have_key(:humidity)
      expect(weather_data.current_weather[:humidity]).to be_a(Integer)
      expect(weather_data.current_weather).to have_key(:visibility_miles)
      expect(weather_data.current_weather[:visibility_miles]).to be_a(Float)
      expect(weather_data.current_weather).to have_key(:uvi)
      expect(weather_data.current_weather[:uvi]).to be_a(Float)
    end

    it 'returns forecast weather for a given location' do
      location = "denver,co"
      weather_data = WeatherFacade.new.get_weather_data(location)

      expect(weather_data.daily_weather).to be_an(Array)
      expect(weather_data.daily_weather.count).to eq(5)
      weather_data.daily_weather.each do |day|
        expect(day).to be_a(Hash)
        expect(day).to have_key(:date)
        expect(day[:date]).to be_a(String)
        expect(day).to have_key(:max_temp)
        expect(day[:max_temp]).to be_a(Float)
        expect(day).to have_key(:min_temp)
        expect(day[:min_temp]).to be_a(Float)
        expect(day).to have_key(:conditions)
        expect(day[:conditions]).to be_a(String)
        expect(day).to have_key(:icon)
        expect(day[:icon]).to be_a(String)
        expect(day).to have_key(:sunrise)
        expect(day[:sunrise]).to be_a(String)
        expect(day).to have_key(:sunset)
        expect(day[:sunset]).to be_a(String)
      end
    end

    it 'returns hourly weather for a given location' do
      location = "denver,co"
      weather_data = WeatherFacade.new.get_weather_data(location)

      expect(weather_data.hourly_weather).to be_an(Array)
      expect(weather_data.hourly_weather.count).to eq(24)
      weather_data.hourly_weather.each do |hour|
        expect(hour).to be_a(Hash)
        expect(hour).to have_key(:time)
        expect(hour[:time]).to be_a(String)
        expect(hour).to have_key(:temp_f)
        expect(hour[:temp_f]).to be_a(Float)
        expect(hour).to have_key(:conditions)
        expect(hour[:conditions]).to be_a(String)
        expect(hour).to have_key(:icon)
        expect(hour[:icon]).to be_a(String)
      end
    end
  end
end