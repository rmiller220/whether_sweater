class BooksController < ApplicationController

  def index
    if params[:limit] < 1
      render json: {error: "Please provide a limit greater than 0"}, status: 400
    else
      books = BookFacade.new.get_books(params[:location, :limit])
      render json: BookSerializer.new(books)
    end
  end
end