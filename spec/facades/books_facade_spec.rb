require 'rails_helper'

RSpec.describe 'Books Facade' do
  describe 'instance methods' do
    it 'returns a list of books for a given search' do
      books_data = BooksFacade.new.get_books_info("denver,co", 5)
      require 'pry'; binding.pry
    end
  end
end