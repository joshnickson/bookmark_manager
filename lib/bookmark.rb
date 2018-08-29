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
    result.map { |bookmark| bookmark['url'] }
  end

  def self.create(bookmark)
    return false unless is_url?(bookmark)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end  
    connection.exec("INSERT INTO bookmarks (url) VALUES ('#{bookmark}');")
  end

  def self.is_url?(bookmark)
    bookmark =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

end