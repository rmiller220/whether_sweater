require 'rails_helper'

RSpec.describe 'Book Search API', type: :request do
  describe 'GET /api/v0/book-search' do
    it 'returns a list of books for a given search and forecast for that location' do

      get "/api/v0/book-search?location=denver,co&quantity=5"

      expect(response).to be_successful
      expect(response.status).to eq(200)
      
      books_data = JSON.parse(response.body, symbolize_names: true)
  
      expect(books_data).to be_a(Hash)
      expect(books_data).to have_key(:data)
      expect(books_data[:data]).to be_a(Hash)
      expect(books_data[:data]).to have_key(:id)
      expect(books_data[:data][:id]).to eq('null')
      expect(books_data[:data]).to have_key(:type)
      expect(books_data[:data][:type]).to eq('books')
      expect(books_data[:data]).to have_key(:attributes)
      expect(books_data[:data][:attributes]).to be_a(Hash)
      expect(books_data[:data][:attributes]).to have_key(:destination)
      expect(books_data[:data][:attributes][:destination]).to eq('denver,co')
      expect(books_data[:data][:attributes][:destination]).to be_a(String)
      expect(books_data[:data][:attributes]).to have_key(:forecast)
      expect(books_data[:data][:attributes][:forecast]).to be_a(Hash)
      expect(books_data[:data][:attributes][:forecast]).to have_key(:summary)
      expect(books_data[:data][:attributes][:forecast][:summary]).to be_a(String)
      expect(books_data[:data][:attributes][:forecast]).to have_key(:temperature)
      expect(books_data[:data][:attributes][:forecast][:temperature]).to be_a(Float)
      expect(books_data[:data][:attributes]).to have_key(:books_found)
      expect(books_data[:data][:attributes][:books_found]).to be_an(Integer)
      expect(books_data[:data][:attributes]).to have_key(:books_info)
      expect(books_data[:data][:attributes][:books_info]).to be_an(Array)
      expect(books_data[:data][:attributes][:books_info].count).to eq(5)

      books_data[:data][:attributes][:books_info].each do |book|
        expect(book).to be_a(Hash)
        expect(book).to have_key(:title)
        expect(book[:title]).to be_a(String)
        expect(book).to have_key(:publisher)
        expect(book[:publisher]).to be_a(Array)
        expect(book[:publisher][0]).to be_a(String)
        expect(book).to have_key(:isbn)
        expect(book[:isbn]).to be_an(Array)
        expect(book[:isbn][0]).to be_a(String)
        expect(book[:isbn][1]).to be_a(String)
      end
    end
    
    it 'returns a 400 error if quantity is less than 1' do
      get "/api/v0/book-search?location=denver,co&quantity=0"

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:error]).to eq("Please provide a limit greater than 0")
    end

    it 'returns a list of books for a given search and forecast for that location' do
      get "/api/v0/book-search?location=washington,dc&quantity=5"
  
      expect(response).to be_successful
      expect(response.status).to eq(200)
      
      books_data = JSON.parse(response.body, symbolize_names: true)
  
      expect(books_data).to be_a(Hash)
      expect(books_data).to have_key(:data)
      expect(books_data[:data]).to be_a(Hash)
      expect(books_data[:data]).to have_key(:id)
      expect(books_data[:data][:id]).to eq('null')
      expect(books_data[:data]).to have_key(:type)
      expect(books_data[:data][:type]).to eq('books')
      expect(books_data[:data]).to have_key(:attributes)
      expect(books_data[:data][:attributes]).to be_a(Hash)
      expect(books_data[:data][:attributes]).to have_key(:destination)
      expect(books_data[:data][:attributes][:destination]).to eq('washington,dc')
      expect(books_data[:data][:attributes][:destination]).to be_a(String)
      expect(books_data[:data][:attributes]).to have_key(:forecast)
      expect(books_data[:data][:attributes][:forecast]).to be_a(Hash)
      expect(books_data[:data][:attributes][:forecast]).to have_key(:summary)
      expect(books_data[:data][:attributes][:forecast][:summary]).to be_a(String)
      expect(books_data[:data][:attributes][:forecast]).to have_key(:temperature)
      expect(books_data[:data][:attributes][:forecast][:temperature]).to be_a(Float)
      expect(books_data[:data][:attributes]).to have_key(:books_found)
      expect(books_data[:data][:attributes][:books_found]).to be_an(Integer)
      expect(books_data[:data][:attributes]).to have_key(:books_info)
      expect(books_data[:data][:attributes][:books_info]).to be_an(Array)
      expect(books_data[:data][:attributes][:books_info].length).to eq(5)

      books_data[:data][:attributes][:books_info].each do |book|
        expect(book).to be_a(Hash)
        expect(book).to have_key(:title)
        expect(book[:title]).to be_a(String)
        expect(book).to have_key(:publisher)
        expect(book[:publisher]).to be_a(Array)
        expect(book[:publisher][0]).to be_a(String)
        expect(book).to have_key(:isbn)
        expect(book[:isbn]).to be_an(Array)
        expect(book[:isbn][0]).to be_a(String)
        expect(book[:isbn][1]).to be_a(String)
      end
    end

    it 'can search for 1 book result' do
      get "/api/v0/book-search?location=philadelphia,pa&quantity=1"

      expect(response).to be_successful
      expect(response.status).to eq(200)
      
      books_data = JSON.parse(response.body, symbolize_names: true)
  
      expect(books_data).to be_a(Hash)
      expect(books_data).to have_key(:data)
      expect(books_data[:data]).to be_a(Hash)
      expect(books_data[:data]).to have_key(:id)
      expect(books_data[:data][:id]).to eq('null')
      expect(books_data[:data]).to have_key(:type)
      expect(books_data[:data][:type]).to eq('books')
      expect(books_data[:data]).to have_key(:attributes)
      expect(books_data[:data][:attributes]).to be_a(Hash)
      expect(books_data[:data][:attributes]).to have_key(:destination)
      expect(books_data[:data][:attributes][:destination]).to eq('philadelphia,pa')
      expect(books_data[:data][:attributes][:destination]).to be_a(String)
      expect(books_data[:data][:attributes]).to have_key(:forecast)
      expect(books_data[:data][:attributes][:forecast]).to be_a(Hash)
      expect(books_data[:data][:attributes][:forecast]).to have_key(:summary)
      expect(books_data[:data][:attributes][:forecast][:summary]).to be_a(String)
      expect(books_data[:data][:attributes][:forecast]).to have_key(:temperature)
      expect(books_data[:data][:attributes][:forecast][:temperature]).to be_a(Float)
      expect(books_data[:data][:attributes]).to have_key(:books_found)
      expect(books_data[:data][:attributes][:books_found]).to be_an(Integer)
      expect(books_data[:data][:attributes]).to have_key(:books_info)
      expect(books_data[:data][:attributes][:books_info]).to be_an(Array)
      expect(books_data[:data][:attributes][:books_info].count).to eq(1)

      books_data[:data][:attributes][:books_info].each do |book|
        expect(book).to be_a(Hash)
        expect(book).to have_key(:title)
        expect(book[:title]).to be_a(String)
        expect(book).to have_key(:publisher)
        expect(book[:publisher]).to be_a(Array)
        expect(book[:publisher][0]).to be_a(String)
        expect(book).to have_key(:isbn)
        expect(book[:isbn]).to be_an(Array)
        expect(book[:isbn][0]).to be_a(String)
        expect(book[:isbn][1]).to be_a(String)
      end
    end
  end
end