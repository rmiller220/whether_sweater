require 'rails_helper'

RSpec.describe 'Road Trip request' do
  describe 'POST /api/v0/road_trip' do
    it 'returns road trip data' do

      headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}
      post '/api/v0/road_trip', headers: headers, params: {origin: 'Denver,CO', destination: 'Pueblo,CO'}
    end
  end
end