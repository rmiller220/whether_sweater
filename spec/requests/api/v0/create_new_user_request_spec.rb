require 'rails_helper'

RSpec.describe 'Create new user request' do
  describe 'POST /api/v0/users' do
    it 'creates a new user' do
      post '/api/v0/users', params: {email: 'bob@bob.bob', password: 'bob', password_confirmation: 'bob'}

      expect(response).to be_successful
      expect(response.status).to eq(201)

      user_data = JSON.parse(response.body, symbolize_names: true)

      expect(user_data).to be_a(Hash)
      expect(user_data).to have_key(:data)
      expect(user_data[:data]).to be_a(Hash)
      expect(user_data[:data]).to have_key(:id)
      expect(user_data[:data][:id]).to be_a(String)
      expect(user_data[:data]).to have_key(:type)
      expect(user_data[:data][:type]).to eq('users')
      expect(user_data[:data]).to have_key(:attributes)
      expect(user_data[:data][:attributes]).to be_a(Hash)
      expect(user_data[:data][:attributes]).to have_key(:email)
      expect(user_data[:data][:attributes][:email]).to be_a(String)
      expect(user_data[:data][:attributes]).to have_key(:api_key)
      expect(user_data[:data][:attributes][:api_key]).to be_a(String)
      expect(user_data[:data][:attributes][:api_key]).to_not be(nil)
      expect(user_data[:data][:attributes]).to_not have_key(:password)
    end

    it 'returns a 400 error if email is already taken' do
      user1 = User.create!(email: 'bob@bob.bob', password: 'bob', password_confirmation: 'bob')

      post '/api/v0/users', params: {email: 'bob@bob.bob', password: '123', password_confirmation: '123'}

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:error]).to eq("Email has already been taken")
    end

    it 'returns a 400 error if password and password confirmation do not match' do

      post '/api/v0/users', params: {email: 'bob@bob.bob', password: '123', password_confirmation: 'bob'}

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:error]).to eq("Password confirmation doesn't match Password")
    end

    it 'returns a 400 error if email is not provided' do

      post '/api/v0/users', params: {password: '123', password_confirmation: '123'}

      expect(response).to_not be_successful
      expect(response.status).to eq(400)  

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:error]).to eq("Email can't be blank")
    end

    it 'returns a 400 error if password is not provided' do

      post '/api/v0/users', params: {email: 'bob@bob.bob'}

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      
      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:error]).to eq("Password can't be blank, Password confirmation can't be blank, and Password can't be blank")
    end

    it 'returns a 400 error if password confirmation is not provided' do

      post '/api/v0/users', params: {email: 'bob@bob.bob', password: '123'}
      
      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:error]).to eq("Password confirmation can't be blank")
    end

    it 'returns a 400 error if password is blank' do

      post '/api/v0/users', params: {email: 'bob@bob.bob', password_confirmation: '123'}

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      
      response_body = JSON.parse(response.body, symbolize_names: true)  

      expect(response_body[:error]).to eq("Password can't be blank and Password can't be blank")
    end
  end
end