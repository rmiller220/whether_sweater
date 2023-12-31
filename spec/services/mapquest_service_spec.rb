require 'rails_helper'

RSpec.describe 'Mapquest Service' do  
  describe 'instance methods' do
    it 'returns lat and long for a given location' do
      mapquest_service = MapquestService.new
      mapquest_results = mapquest_service.get_mapquest_data("Denver,co")

      expect(mapquest_results).to be_a(Hash)
      expect(mapquest_results).to have_key(:results)
      expect(mapquest_results[:results]).to be_an(Array)
      expect(mapquest_results[:results][0]).to have_key(:locations)
      expect(mapquest_results[:results][0][:locations]).to be_an(Array)
      expect(mapquest_results[:results][0][:locations][0]).to have_key(:latLng)
      expect(mapquest_results[:results][0][:locations][0][:latLng]).to be_a(Hash)
      expect(mapquest_results[:results][0][:locations][0][:latLng]).to have_key(:lat)
      expect(mapquest_results[:results][0][:locations][0][:latLng][:lat]).to be_a(Float)
      expect(mapquest_results[:results][0][:locations][0][:latLng]).to have_key(:lng)
      expect(mapquest_results[:results][0][:locations][0][:latLng][:lng]).to be_a(Float)
    end

    it 'returns travel time for a given origin and destination' do
      mapquest_service = MapquestService.new
      directions_results = mapquest_service.get_directions_data("NewYork,NY", "LosAngeles,CA")

      expect(directions_results).to be_a(Hash)
      expect(directions_results).to have_key(:route)
      expect(directions_results[:route]).to be_a(Hash)
      expect(directions_results[:route]).to have_key(:formattedTime)
      expect(directions_results[:route][:formattedTime]).to be_a(String)
      expect(directions_results[:route]).to have_key(:realTime)
      expect(directions_results[:route][:realTime]).to be_a(Integer)
      expect(directions_results[:route]).to have_key(:distance)
      expect(directions_results[:route][:distance]).to be_a(Float)
      expect(directions_results[:route]).to have_key(:time)
      expect(directions_results[:route][:time]).to be_a(Integer)
      expect(directions_results[:route]).to have_key(:legs)
      expect(directions_results[:route][:legs]).to be_an(Array)
    end
  end
end