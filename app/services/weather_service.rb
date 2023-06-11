class WeatherService
  
  def get_weather_data(lat, lon)
    get_url("/v1/forecast.json?q=#{lat},#{lon}")
  end


  private
    def get_url(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new(url: "http://api.weatherapi.com") do |faraday|
        faraday.params["key"] = ENV["WEATHER_API_KEY"]
        faraday.params["days"] = 5
      end
    end
end

#http://api.weatherapi.com/v1/forecast.json?key={{weather_api_key}}&q=39.74001,-104.99202&days=5