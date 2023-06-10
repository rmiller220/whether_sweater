require 'rails_helper'

RSpec.describe 'Forecast API' type: :request do
  describe 'GET /api/v0/forecast' do

    headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}
    GET "/api/v0/forecast?location=cincinatti,oh", headers: headers

    expect(response).to be_successful
    expect(response.status).to eq(200)

    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(forecast).to be_a(Hash)
    expect(forecast).to have_key(:data)
    
  end
end