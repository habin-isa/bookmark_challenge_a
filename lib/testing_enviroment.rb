require 'pg'

p "Setting up testing enviroment..."

connect = PG.connect :dbname => 'bookmark_manager_test'

connect.exec("TRUNCATE bookmarks;")
connect.exec("INSERT INTO bookmarks VALUES(DEFAULT, 'https://www.youtube.com', 'YouTube');")
connect.exec("INSERT INTO bookmarks VALUES(DEFAULT, 'https://www.google.com', 'Google');")
connect.exec("INSERT INTO bookmarks VALUES(DEFAULT, 'https://www.makersacademy.com', 'Makers Academy');")
