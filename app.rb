require 'sinatra/base'

class BookmarkManager < Sinatra::Base
  get '/' do
    @bookmarks = [
              'https://makersstudents.slack.com',
              'https://www.bbc.co.uk/sport/football',
              'https://makersstudents.slack.com',
              ]
  end

  run! if app_file == $0
end