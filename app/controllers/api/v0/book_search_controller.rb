class Api::V0::BookSearchController < ApplicationController

  def index
    # require 'pry'; binding.pry
    if params[:quantity].to_i < 1
      render json: {error: "Please provide a limit greater than 0"}, status: 400
    else
      books = BooksFacade.new.get_books_info(params[:location], params[:quantity])
      # require 'pry'; binding.pry
      render json: BooksSerializer.new(books)
    end
  end
end