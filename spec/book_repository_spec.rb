require 'book_repository'

RSpec.describe BookRepository do
  
  def reset_books_table
    seed_sql = File.read('spec/seeds_books.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test'})
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_books_table
  end

  it "returns list of all books" do
    repo = BookRepository.new
    book_list = repo.all
    output = []
    book_titles = ["Nineteen Eighty-Four", "Mrs Dalloway", "Emma", "Dracula","The Age of Innocence"]
    book_list.each { |book|
      output << book.title
    }

    expect(output.length).to eq 5
    expect(output).to eq book_titles
  end
  
  it "returns title of single book" do
    repo = BookRepository.new
    book_list = repo.all
    expect(book_list[0].title).to eq "Nineteen Eighty-Four"
  end

end