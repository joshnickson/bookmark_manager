require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/bookmarks/new' do
    @bookmarks = Bookmark.all
    erb :add
  end

  post '/bookmarks' do
    Bookmark.create(params[:new_bookmark_name])
    redirect '/bookmarks'
  end
  
  run! if app_file == $0
end