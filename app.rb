require 'sinatra/base'
require_relative './lib/bookmark.rb'

class BookmarkManager < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  get '/add_bookmark' do
    erb :add_bookmark
  end

  post '/add_bookmark/add_confirmation' do
    @new_bookmark = params[:new_bookmark]
    Bookmark.create(@new_bookmark)
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
