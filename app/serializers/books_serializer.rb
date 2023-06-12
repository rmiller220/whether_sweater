class BooksSerializer
  include JSONAPI::Serializer
  attributes :destination, :forecast, :books_found, :books_info
end
