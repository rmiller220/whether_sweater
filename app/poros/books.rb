class Books
  attr_reader :destination,
              :forecast,
              :books_found,
              :books_info,
              :id,
              :type
  def initialize(location, forecast, books_found, books_info)
    @id ='null'
    @type = 'books'
    @destination = location
    @forecast = forecast
    @books_found = books_found
    @books_info = books_info
  end
end