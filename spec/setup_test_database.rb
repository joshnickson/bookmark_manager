require 'pg'

def setup_test_database
  p "Setting up test database..."

  connection = PG.connect(dbname: 'bookmark_manager_test')

  connection.exec("TRUNCATE bookmarks;")

  connection.exec("INSERT INTO bookmarks (url) VALUES ('http://makersacademy.com');")
  connection.exec("INSERT INTO bookmarks (url) VALUES ('http://destroyallsoftware.com');")
  connection.exec("INSERT INTO bookmarks (url) VALUES ('http://google.com');")
end