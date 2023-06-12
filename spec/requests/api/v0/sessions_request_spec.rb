require 'rails_helper'

RSpec.describe 'Sessions request' do
  describe 'POST /api/v0/sessions' do
    it 'creates a new session' do
      user = User.create!(email: 'bob@bob.bob', password: 'bob', password_confirmation: 'bob')

      user_params = {email: 'bob@bob.bob', password: 'bob'}
      post '/api/v0/sessions', params: user_params.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

      expect(response).to be_successful
      expect(response.status).to eq(200)

      session_data = JSON.parse(response.body, symbolize_names: true)

      expect(session_data).to be_a(Hash)
      expect(session_data).to have_key(:data)
      expect(session_data[:data]).to be_a(Hash)
      expect(session_data[:data]).to have_key(:id)
      expect(session_data[:data][:id]).to be_a(String)
      expect(session_data[:data]).to have_key(:type)
      expect(session_data[:data][:type]).to eq('users')
      expect(session_data[:data]).to have_key(:attributes)
      expect(session_data[:data][:attributes]).to be_a(Hash)
      expect(session_data[:data][:attributes]).to have_key(:email)
      expect(session_data[:data][:attributes][:email]).to be_a(String)
      expect(session_data[:data][:attributes]).to have_key(:api_key)
      expect(session_data[:data][:attributes][:api_key]).to be_a(String)
      expect(session_data[:data][:attributes][:api_key]).to_not be(nil)
      expect(session_data[:data][:attributes][:api_key].length).to eq(32)
      expect(session_data[:data][:attributes]).to_not have_key(:password)
    end

    it 'returns a 400 error if email is not found' do
      user = User.create!(email: 'bob@bob.bob', password: 'bob', password_confirmation: 'bob')

      user_params = {email: 'tim@tim.tim', password: 'bob'}
      post '/api/v0/sessions', params: user_params.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

      expect(response).to_not be_successful
      expect(response.status).to eq(401)
      
      data = JSON.parse(response.body, symbolize_names: true)

      expect(data).to be_a(Hash)
      expect(data).to have_key(:error)
      expect(data[:error]).to eq("Sorry, your credentials are bad.")
    end

    it 'returns a 400 error if password is incorrect' do
      user = User.create!(email: 'bob@bob.bob', password: 'bob', password_confirmation: 'bob')

      user_params = {email: 'bob@bob.bob', password: '123'}
      post '/api/v0/sessions', params: user_params.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

      expect(response).to_not be_successful
      expect(response.status).to eq(401)

      data = JSON.parse(response.body, symbolize_names: true)

      expect(data).to be_a(Hash)
      expect(data).to have_key(:error)
      expect(data[:error]).to eq("Sorry, your credentials are bad.")
    end
  end
end