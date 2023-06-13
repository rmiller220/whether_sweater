require 'rails_helper'

RSpec.describe 'Mapquest Facade' do
  describe 'instance methods' do
    it 'returns lat and long for a given location' do
      search = ("denver,co")
      coordinates = MapquestFacade.new(search).find_coordinates

      expect(coordinates).to be_a(Mapquest)
      expect(coordinates.lat).to be_a(Float)
      expect(coordinates.lon).to be_a(Float)
    end
  end
end