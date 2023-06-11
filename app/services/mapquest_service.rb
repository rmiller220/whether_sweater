class MapquestService

  def get_mapquest_data(location)
    get_url("geocoding/v1/address?location=#{location}")
  end

  

    def get_url(url)
      response = conn.get(url)
        JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new(url: "https://www.mapquestapi.com/") do |faraday|
        faraday.params['key'] = ENV['MAPQUEST_API_KEY']
      end
    end
end

# https://www.mapquestapi.com/geocoding/v1/address?key={{mapquest_api_key}}&location=Washington,DC