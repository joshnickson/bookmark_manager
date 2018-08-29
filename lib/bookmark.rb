require 'pg'
require 'uri'

class Bookmark
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec("SELECT * FROM bookmarks")
    result.map { |bookmark| [bookmark['url'], bookmark['title']] }
  end

  def self.create(bookmark, title = "title empty")
    return false unless is_url?(bookmark)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end  
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('#{bookmark}', '#{title}');")
  end

  def self.is_url?(bookmark)
    bookmark =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

end