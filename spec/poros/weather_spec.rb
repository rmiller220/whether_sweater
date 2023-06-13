require 'rails_helper'

RSpec.describe 'Weather Poros' do
  it "exists" do


    
    current_weather =
      {:last_updated=>"2023-06-13 13:30",
      :temp_f=>52.9,
      :condition_text=>"Light rain",
      :icon=>"//cdn.weatherapi.com/weather/64x64/day/296.png",
      :humidity=>80,
      :feelslike_f=>51.7,
      :visibility_miles=>9.0,
      :uvi=>5.0}

    daily_weather =
      [{:date=>"2023-06-13",
      :max_temp=>63.9,
      :min_temp=>51.6,
      :conditions=>"Patchy rain possible",
      :icon=>"//cdn.weatherapi.com/weather/64x64/day/176.png",
      :sunrise=>"05:32 AM",
      :sunset=>"08:29 PM"},
      {:date=>"2023-06-14",
      :max_temp=>82.9,
      :min_temp=>52.3,
      :conditions=>"Patchy rain possible",
      :icon=>"//cdn.weatherapi.com/weather/64x64/day/176.png",
      :sunrise=>"05:32 AM",
      :sunset=>"08:29 PM"},
      {:date=>"2023-06-15", :max_temp=>74.3, :min_temp=>56.1, :conditions=>"Moderate rain", :icon=>"//cdn.weatherapi.com/weather/64x64/day/302.png", :sunrise=>"05:32 AM", :sunset=>"08:29 PM"},
      {:date=>"2023-06-16", :max_temp=>73.0, :min_temp=>53.8, :conditions=>"Moderate rain", :icon=>"//cdn.weatherapi.com/weather/64x64/day/302.png", :sunrise=>"05:32 AM", :sunset=>"08:30 PM"},
      {:date=>"2023-06-17",
      :max_temp=>80.8,
      :min_temp=>53.1,
      :conditions=>"Patchy rain possible",
      :icon=>"//cdn.weatherapi.com/weather/64x64/day/176.png",
      :sunrise=>"05:32 AM",
      :sunset=>"08:30 PM"}]

    hourly_weather =
      [{:time=>"00:00", :temp_f=>54.1, :conditions=>"Clear", :icon=>"//cdn.weatherapi.com/weather/64x64/night/113.png"},
      {:time=>"01:00", :temp_f=>53.6, :conditions=>"Clear", :icon=>"//cdn.weatherapi.com/weather/64x64/night/113.png"},
      {:time=>"02:00", :temp_f=>53.2, :conditions=>"Clear", :icon=>"//cdn.weatherapi.com/weather/64x64/night/113.png"},
      {:time=>"03:00", :temp_f=>52.5, :conditions=>"Thundery outbreaks possible", :icon=>"//cdn.weatherapi.com/weather/64x64/night/200.png"},
      {:time=>"04:00", :temp_f=>52.0, :conditions=>"Thundery outbreaks possible", :icon=>"//cdn.weatherapi.com/weather/64x64/night/200.png"},
      {:time=>"05:00", :temp_f=>52.0, :conditions=>"Thundery outbreaks possible", :icon=>"//cdn.weatherapi.com/weather/64x64/night/200.png"},
      {:time=>"06:00", :temp_f=>52.2, :conditions=>"Thundery outbreaks possible", :icon=>"//cdn.weatherapi.com/weather/64x64/day/200.png"},
      {:time=>"07:00", :temp_f=>54.0, :conditions=>"Thundery outbreaks possible", :icon=>"//cdn.weatherapi.com/weather/64x64/day/200.png"},
      {:time=>"08:00", :temp_f=>55.0, :conditions=>"Light rain shower", :icon=>"//cdn.weatherapi.com/weather/64x64/day/353.png"},
      {:time=>"09:00", :temp_f=>57.2, :conditions=>"Light rain shower", :icon=>"//cdn.weatherapi.com/weather/64x64/day/353.png"},
      {:time=>"10:00", :temp_f=>57.7, :conditions=>"Patchy light rain with thunder", :icon=>"//cdn.weatherapi.com/weather/64x64/day/386.png"},
      {:time=>"11:00", :temp_f=>58.1, :conditions=>"Patchy light rain with thunder", :icon=>"//cdn.weatherapi.com/weather/64x64/day/386.png"},
      {:time=>"12:00", :temp_f=>59.5, :conditions=>"Light rain shower", :icon=>"//cdn.weatherapi.com/weather/64x64/day/353.png"},
      {:time=>"13:00", :temp_f=>60.6, :conditions=>"Partly cloudy", :icon=>"//cdn.weatherapi.com/weather/64x64/day/116.png"},
      {:time=>"14:00", :temp_f=>61.3, :conditions=>"Partly cloudy", :icon=>"//cdn.weatherapi.com/weather/64x64/day/116.png"},
      {:time=>"15:00", :temp_f=>59.9, :conditions=>"Patchy rain possible", :icon=>"//cdn.weatherapi.com/weather/64x64/day/176.png"},
      {:time=>"16:00", :temp_f=>61.5, :conditions=>"Partly cloudy", :icon=>"//cdn.weatherapi.com/weather/64x64/day/116.png"},
      {:time=>"17:00", :temp_f=>63.1, :conditions=>"Partly cloudy", :icon=>"//cdn.weatherapi.com/weather/64x64/day/116.png"},
      {:time=>"18:00", :temp_f=>64.8, :conditions=>"Partly cloudy", :icon=>"//cdn.weatherapi.com/weather/64x64/day/116.png"},
      {:time=>"19:00", :temp_f=>64.4, :conditions=>"Sunny", :icon=>"//cdn.weatherapi.com/weather/64x64/day/113.png"},
      {:time=>"20:00", :temp_f=>60.8, :conditions=>"Partly cloudy", :icon=>"//cdn.weatherapi.com/weather/64x64/day/116.png"},
      {:time=>"21:00", :temp_f=>58.1, :conditions=>"Partly cloudy", :icon=>"//cdn.weatherapi.com/weather/64x64/night/116.png"},
      {:time=>"22:00", :temp_f=>56.8, :conditions=>"Partly cloudy", :icon=>"//cdn.weatherapi.com/weather/64x64/night/116.png"},
      {:time=>"23:00", :temp_f=>56.3, :conditions=>"Partly cloudy", :icon=>"//cdn.weatherapi.com/weather/64x64/night/116.png"}]

      weather = Weather.new(current_weather, daily_weather, hourly_weather)

      expect(weather).to be_a(Weather)
      expect(weather.id).to eq('null')
      expect(weather.type).to eq('forecast')
      expect(weather.current_weather).to eq(current_weather)
      expect(weather.daily_weather).to eq(daily_weather)
      expect(weather.hourly_weather).to eq(hourly_weather)
  end
end