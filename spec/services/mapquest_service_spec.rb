require 'rails_helper'

RSpec.describe 'Mapquest Service' do  
  describe 'instance methods', :vcr do
    it 'returns lat and long for a given location' do
      mapquest_service = MapquestService.new
      mapquest_results = mapquest_service.get_coordinates("Denver,co")

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
  end
end