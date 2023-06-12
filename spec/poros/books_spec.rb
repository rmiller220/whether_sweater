require 'rails_helper'

RSpec.describe 'Books Poros' do
  describe 'instance methods' do
    it 'exists' do  
      books_data = Books.new("denver,co", {:summary=>"Sunny", :temperature=>80}, 80, [{:isbn=>["9780062457714", "0062457713"], :title=>"The Subtle Art of Not Giving a F*ck: A Counterintuitive Approach to Living a Good Life", :publisher=>["HarperOne", "HarperOne"]}])

      expect(books_data).to be_a(Books)
      expect(books_data.id).to eq('null')
      expect(books_data.type).to eq('books')
      expect(books_data.books_found).to be_an(Integer)
      expect(books_data.books_found).to eq(80)
      expect(books_data.destination).to be_a(String)
      expect(books_data.destination).to eq('denver,co')
      expect(books_data.forecast).to be_a(Hash)
      expect(books_data.forecast).to eq({:summary=>"Sunny", :temperature=>80})
      expect(books_data.books_info).to be_an(Array)
      expect(books_data.books_info.count).to eq(1)
      expect(books_data.books_info[0]).to be_a(Hash)
      expect(books_data.books_info[0]).to eq({:isbn=>["9780062457714", "0062457713"], :title=>"The Subtle Art of Not Giving a F*ck: A Counterintuitive Approach to Living a Good Life", :publisher=>["HarperOne", "HarperOne"]})
    end

    it 'returns a list of books for a given search' do
      books_data = BooksFacade.new.get_books_info("denver,co", 5)

      expect(books_data).to be_a(Books)
      expect(books_data.id).to eq('null')
      expect(books_data.type).to eq('books')
      expect(books_data.books_found).to be_an(Integer)
      expect(books_data.destination).to be_a(String)
      expect(books_data.destination).to eq('denver,co')
      expect(books_data.forecast).to be_a(Hash)
      expect(books_data.forecast).to have_key(:summary)
      expect(books_data.forecast[:summary]).to be_a(String)
      expect(books_data.forecast).to have_key(:temperature)
      expect(books_data.forecast[:temperature]).to be_a(Float)
      expect(books_data.books_info).to be_an(Array)
      books_data.books_info.each do |book|
        expect(book).to be_a(Hash)
        expect(book).to have_key(:isbn)
        expect(book[:isbn]).to be_an(Array)
        expect(book[:isbn][0]).to be_a(String)
        expect(book[:isbn][1]).to be_a(String)
        expect(book).to have_key(:title)
        expect(book[:title]).to be_a(String)
        expect(book).to have_key(:publisher)
        expect(book[:publisher]).to be_a(Array)
        expect(book[:publisher][0]).to be_a(String)
      end
    end
  end
end