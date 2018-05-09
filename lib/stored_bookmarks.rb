require 'pg'

class StoredBookmarks

  def all

    begin

      connect = PG.connect :dbname => 'bookmark_manager', :user => 'anderscodes'

      result = connect.exec "SELECT * FROM bookmarks"

      result.map{ |row| row['url']  }

    end

  end

end
