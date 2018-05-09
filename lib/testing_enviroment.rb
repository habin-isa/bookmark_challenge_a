require 'pg'

p "Setting up testing enviroment..."

connect = PG.connect :dbname => 'bookmark_manager_test'

connect.exec("TRUNCATE bookmarks;")
connect.exec("INSERT INTO bookmarks VALUES(DEFAULT, 'https://www.youtube.com');")
connect.exec("INSERT INTO bookmarks VALUES(DEFAULT, 'https://www.google.com');")
connect.exec("INSERT INTO bookmarks VALUES(DEFAULT, 'https://www.makersacademy.com');")
