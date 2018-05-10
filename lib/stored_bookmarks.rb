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
    result.map{ |row| row['url']  }
  end

  def self.add(new_bookmark)
      enviroment
      @connect.exec("INSERT INTO bookmarks VALUES(DEFAULT, '#{new_bookmark}');")
  end

  def self.url_check(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end


end
