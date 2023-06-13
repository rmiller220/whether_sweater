require 'rails_helper'

RSpec.describe 'Roadtrip Facade' do
  describe 'instance methods' do
    it 'returns travel time for a given origin and destination' do
      start = ("NewYork,NY")
      final = ("LosAngeles,CA")
      travel_time = RoadtripFacade.new.find_travel_time(start, final)

      expect(travel_time).to be_a(RoadTrip)
      expect(travel_time.start_city).to eq(start)
      expect(travel_time.end_city).to eq(final)
      expect(travel_time.travel_time).to be_a(String)
      expect(travel_time.weather_at_eta).to be_a(Hash)
      expect(travel_time.weather_at_eta).to have_key(:temperature)
      expect(travel_time.weather_at_eta[:temperature]).to be_a(Float)
      expect(travel_time.weather_at_eta).to have_key(:conditions)
      expect(travel_time.weather_at_eta[:conditions]).to be_a(String)
      expect(travel_time.weather_at_eta).to have_key(:datetime)
      expect(travel_time.weather_at_eta[:datetime]).to be_a(String)
    end
  end
end