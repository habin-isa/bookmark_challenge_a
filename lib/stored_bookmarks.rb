require 'pg'

class StoredBookmarks

  def self.enviroment
    if ENV['ENVIROMENT'] == 'test'
      @connect = PG.connect :dbname => 'bookmark_manager_test'
    else
      @connect = PG.connect :dbname => 'bookmark_manager'
    end
  end

  def self.all
    enviroment
    result = @connect.exec "SELECT * FROM bookmarks"
    result.map{ |row| row['url']  }
  end

  def self.add(new_bookmark)
    enviroment
    @connect.exec("INSERT INTO bookmarks VALUES(DEFAULT, '#{new_bookmark}');")
  end


end
