require 'rails_helper'

RSpec.describe 'Book Search API', type: :request do
  describe 'GET /api/v0/book-search' do
    it 'returns a list of books for a given search and forecast for location' do

      get "/api/v0/book-search?location=denver,co&quantity=5"

      expect(response).to be_successful
      expect(response.status).to eq(200)
      
      books_data = JSON.parse(response.body, symbolize_names: true)
      require 'pry'; binding.pry
    end
  end
end