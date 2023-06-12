require 'rails_helper'

RSpec.describe 'Book Search API', type: :request do
  describe 'GET /api/v0/book-search' do
    it 'returns a list of books for a given search and forecast for location' do

      get "/api/v0/book-search?location=denver,co&quantity=5"
    end
  end
end