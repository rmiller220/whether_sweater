class BookSearchService

  def get_books_data(location, limit)
    get_url("search.json?q=#{location}&limit=#{limit}")
  end
  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://openlibrary.org/')
  end
end


# https://openlibrary.org/search.json?q=denver,co&limit=5