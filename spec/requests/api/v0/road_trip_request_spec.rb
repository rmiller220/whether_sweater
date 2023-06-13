require 'rails_helper'

RSpec.describe 'Road Trip request' do
  describe 'POST /api/v0/road_trip' do
    it 'returns road trip data ' do
      user = User.create!(email: 'bob@bob.bob', password: 'bob', password_confirmation: 'bob', api_key: 'jgn983hy48thw9begh98h4539h4fd2e')
      
      post '/api/v0/road_trip', params: {origin: 'NewYork,NY', destination: 'LosAngeles,CA', api_key: user.api_key}

      expect(response).to be_successful
      expect(response.status).to eq(200)

      map_data = JSON.parse(response.body, symbolize_names: true)

      expect(map_data).to be_a(Hash)
      expect(map_data).to have_key(:data)
      expect(map_data[:data]).to be_a(Hash)
      expect(map_data[:data]).to have_key(:id)
      expect(map_data[:data][:id]).to be_a(String)
      expect(map_data[:data][:id]).to eq('null')
      expect(map_data[:data]).to have_key(:type)
      expect(map_data[:data][:type]).to eq('road_trip')
      expect(map_data[:data]).to have_key(:attributes)
      expect(map_data[:data][:attributes]).to be_a(Hash)
      expect(map_data[:data][:attributes]).to have_key(:start_city)
      expect(map_data[:data][:attributes][:start_city]).to be_a(String)
      expect(map_data[:data][:attributes]).to have_key(:end_city)
      expect(map_data[:data][:attributes][:end_city]).to be_a(String)
      expect(map_data[:data][:attributes]).to have_key(:travel_time)
      expect(map_data[:data][:attributes][:travel_time]).to be_a(String)
      expect(map_data[:data][:attributes]).to have_key(:weather_at_eta)
      expect(map_data[:data][:attributes][:weather_at_eta]).to be_a(Hash)
      expect(map_data[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(map_data[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)
      expect(map_data[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
      expect(map_data[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
      expect(map_data[:data][:attributes][:weather_at_eta]).to have_key(:datetime)
      expect(map_data[:data][:attributes][:weather_at_eta][:datetime]).to be_a(String)
    end

    it 'returns road trip data from NY to Panama' do
      user = User.create!(email: 'bob@bob.bob', password: 'bob', password_confirmation: 'bob', api_key: 'jgn983hy48thw9begh98h4539h4fd2e')
      
      post '/api/v0/road_trip', params: {origin: 'NewYork,NY', destination: 'PanamaCity,Panama', api_key: user.api_key}

      expect(response).to be_successful
      expect(response.status).to eq(200)

      map_data = JSON.parse(response.body, symbolize_names: true)

      expect(map_data).to be_a(Hash)
      expect(map_data).to have_key(:data)
      expect(map_data[:data]).to be_a(Hash)
      expect(map_data[:data]).to have_key(:id)
      expect(map_data[:data][:id]).to be_a(String)
      expect(map_data[:data][:id]).to eq('null')
      expect(map_data[:data]).to have_key(:type)
      expect(map_data[:data][:type]).to eq('road_trip')
      expect(map_data[:data]).to have_key(:attributes)
      expect(map_data[:data][:attributes]).to be_a(Hash)
      expect(map_data[:data][:attributes]).to have_key(:start_city)
      expect(map_data[:data][:attributes][:start_city]).to be_a(String)
      expect(map_data[:data][:attributes]).to have_key(:end_city)
      expect(map_data[:data][:attributes][:end_city]).to be_a(String)
      expect(map_data[:data][:attributes]).to have_key(:travel_time)
      expect(map_data[:data][:attributes][:travel_time]).to be_a(String)
      expect(map_data[:data][:attributes]).to have_key(:weather_at_eta)
      expect(map_data[:data][:attributes][:weather_at_eta]).to be_a(Hash)
      expect(map_data[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(map_data[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)
      expect(map_data[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
      expect(map_data[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
      expect(map_data[:data][:attributes][:weather_at_eta]).to have_key(:datetime)
      expect(map_data[:data][:attributes][:weather_at_eta][:datetime]).to be_a(String)
    end

    it 'returns road trip data from NY to London' do
      user = User.create!(email: 'bob@bob.bob', password: 'bob', password_confirmation: 'bob', api_key: 'jgn983hy48thw9begh98h4539h4fd2e')
   
      post '/api/v0/road_trip', params: {origin: 'NewYork,NY', destination: 'London,England', api_key: user.api_key}

      expect(response).to be_successful
      expect(response.status).to eq(200)

      map_data = JSON.parse(response.body, symbolize_names: true)

      expect(map_data).to be_a(Hash)
      expect(map_data).to have_key(:data)
      expect(map_data[:data]).to be_a(Hash)
      expect(map_data[:data]).to have_key(:id)
      expect(map_data[:data][:id]).to be_a(String)
      expect(map_data[:data][:id]).to eq('null')
      expect(map_data[:data]).to have_key(:type)
      expect(map_data[:data][:type]).to eq('road_trip')
      expect(map_data[:data]).to have_key(:attributes)
      expect(map_data[:data][:attributes]).to be_a(Hash)
      expect(map_data[:data][:attributes]).to have_key(:start_city)
      expect(map_data[:data][:attributes][:start_city]).to be_a(String)
      expect(map_data[:data][:attributes]).to have_key(:end_city)
      expect(map_data[:data][:attributes][:end_city]).to be_a(String)
      expect(map_data[:data][:attributes]).to have_key(:travel_time)
      expect(map_data[:data][:attributes][:travel_time]).to be_a(String)
      expect(map_data[:data][:attributes][:travel_time]).to eq("impossible route")
      expect(map_data[:data][:attributes]).to have_key(:weather_at_eta)
      expect(map_data[:data][:attributes][:weather_at_eta]).to be_a(Hash)
      expect(map_data[:data][:attributes][:weather_at_eta]).to eq({})
    end
  end

  describe 'sad paths' do
    it 'returns error if api key is invalid' do
      user = User.create!(email: 'bob@bob.bob', password: 'bob', password_confirmation: 'bob', api_key: 'jgn983hy48thw9begh98h4539h4fd2e')
   
      post '/api/v0/road_trip', params: {origin: 'NewYork,NY', destination: 'London,England', api_key: '2387238097'}

      expect(response).to_not be_successful
      expect(response.status).to eq(401)
    end

    it 'returns error if api key is missing' do
      user = User.create!(email: 'bob@bob.bob', password: 'bob', password_confirmation: 'bob', api_key: 'jgn983hy48thw9begh98h4539h4fd2e')
   
      post '/api/v0/road_trip', params: {origin: 'NewYork,NY', destination: 'London,England'}

      expect(response).to_not be_successful
      expect(response.status).to eq(401)
    end

    it 'returns error if origin is missing' do
      user = User.create!(email: 'bob@bob.bob', password: 'bob', password_confirmation: 'bob', api_key: 'jgn983hy48thw9begh98h4539h4fd2e')
   
      post '/api/v0/road_trip', params: {destination: 'London,England', api_key: user.api_key}

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      
      response_data = JSON.parse(response.body, symbolize_names: true)

      expect(response_data).to be_a(Hash)
      expect(response_data).to have_key(:error)
      expect(response_data[:error]).to eq("Please provide origin and destination")
    end

    it 'returns error if destination is missing' do
      user = User.create!(email: 'bob@bob.bob', password: 'bob', password_confirmation: 'bob', api_key: 'jgn983hy48thw9begh98h4539h4fd2e')
   
      post '/api/v0/road_trip', params: {origin: 'NewYork,NY', api_key: user.api_key}

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      
      response_data = JSON.parse(response.body, symbolize_names: true)

      expect(response_data).to be_a(Hash)
      expect(response_data).to have_key(:error)
      expect(response_data[:error]).to eq("Please provide origin and destination")
    end
  end
end