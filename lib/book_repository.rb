require_relative 'book'
require_relative 'database_connection'

class BookRepository
  def all
    sql = 'SELECT * FROM books'
    result = DatabaseConnection.exec_params(sql, [])
    output = []
    result.each { |item|
      book = Book.new
      book.id = item['id']
      book.title = item['title']
      book.author_name = item['author_name']
      output << book
    }
    return output
  end
end