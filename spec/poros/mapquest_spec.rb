require 'rails_helper'

RSpec.describe 'Mapquest' do
  describe 'initialize' do
    it 'exists' do
      data = {lat: 39.738453, lng: -104.984853}
      coordinates = Mapquest.new(data)

      expect(coordinates).to be_a(Mapquest)
      expect(coordinates.lat).to eq(data[:lat])
      expect(coordinates.lon).to eq(data[:lng])
    end
  end
end