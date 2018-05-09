require 'pg'

class StoredBookmarks

  def self.all
    if ENV['ENVIROMENT'] == 'test'
      connect = PG.connect :dbname => 'bookmark_manager_test'
    else
      connect = PG.connect :dbname => 'bookmark_manager'
    end

    result = connect.exec "SELECT * FROM bookmarks"
    result.map{ |row| row['url']  }
  end

end
