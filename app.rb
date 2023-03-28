require_relative 'lib/database_connection'
require_relative 'lib/book_repository'
DatabaseConnection.connect('book_store')

repo = BookRepository.new
book_list = repo.all
book_list.each { |book|
  puts "#{book.id} - #{book.title} - #{book.author_name}"
}