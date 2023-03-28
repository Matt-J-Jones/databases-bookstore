require 'database_connection'

class BookRepository

  def all
    sql = "SELECT * FROM books"
    result = DatabaseConnection.exec_params(sql, [])
    return result   

    

  end
end