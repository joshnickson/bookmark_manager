require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

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
    bookmark = params[:url]
    title = params[:title]
    flash[:notice] = "URL not recognised" unless Bookmark.create(bookmark, title)
    redirect '/bookmarks'
  end
  
  run! if app_file == $0
end