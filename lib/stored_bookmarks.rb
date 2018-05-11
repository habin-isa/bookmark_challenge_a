require 'pg'
require 'uri'

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
    result.map{ |row| row['title']  }
  end

  def self.add(bookmark, title)
    return false unless url_check(bookmark) != nil
      enviroment
      @connect.exec("INSERT INTO bookmarks(url, title) VALUES('#{bookmark}', '#{title}');")
  end

  def self.url_check(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

  def delete(title)
    environment
    result = @connect.exec "DELETE FROM * bookmarks"
    result.pop{ |row| row['title'] }
  end


end
