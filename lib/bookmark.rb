require 'pg'
require 'uri'

class Bookmark

  attr_reader :id, :title, :url

  def initialize(id, title, url)
    @id  = id
    @title = title
    @url = url
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec("SELECT * FROM bookmarks;")
    result.map do |row|
      Bookmark.new(row['id'], row['title'], row['url'])
    end
  end

  def self.create(url:, title:)
    return false unless is_url?(url)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end  
    result = connection.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') RETURNING id, title, url;")
    Bookmark.new(result[0]['id'], result[0]['title'], result[0]['url'])
  end

  def self.is_url?(bookmark)
    bookmark =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

end