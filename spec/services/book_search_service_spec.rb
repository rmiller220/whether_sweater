require 'rails_helper'

RSpec.describe 'Book Search Service' do
  describe 'instance methods' do
    it 'returns a list of books for a given search' do
      book_search_service = BookSearchService.new
      book_search_results = book_search_service.get_books_data("Denver,co", 5)

      expect(book_search_results).to be_a(Hash)
      expect(book_search_results).to have_key(:numFound)
      expect(book_search_results[:numFound]).to be_a(Integer)
      expect(book_search_results).to have_key(:docs)
      expect(book_search_results[:docs]).to be_an(Array)
      expect(book_search_results[:docs].count).to eq(5)
      book_search_results[:docs].each do |book|
        expect(book).to be_a(Hash)
        expect(book).to have_key(:title)
        expect(book[:title]).to be_a(String)
        expect(book).to have_key(:isbn)
        expect(book[:isbn]).to be_an(Array)
        expect(book[:isbn][0]).to be_a(String)
        expect(book[:isbn][1]).to be_a(String)
        expect(book).to have_key(:publisher)
        expect(book[:publisher]).to be_an(Array)
        expect(book[:publisher][0]).to be_a(String)
      end
    end
  end
end