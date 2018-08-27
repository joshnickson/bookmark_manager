require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    @bookmarks = Bookmark.all
    # @bookmarks = [
    #           'https://makersstudents.slack.com',
    #           'https://www.bbc.co.uk/sport/football',
    #           'https://makersstudents.slack.com',
    #           ]
    erb :index
  end

  run! if app_file == $0
end