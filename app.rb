require 'sinatra/base'
require_relative './lib/bookmark.rb'


class BookmarkManager < Sinatra::Base
  enable :method_override
  
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
    @title = params[:title]
    Bookmark.create(@title, @new_bookmark)
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id/delete' do
    bookmark_id = params[:id]
    Bookmark.delete(bookmark_id)
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/update' do
    bookmark_id = params[:id]
    @uniquebookmark = Bookmark.find(bookmark_id)
    p bookmark_id
    p @uniquebookmark
    p @uniquebookmark.id
    erb :update
  end

  patch '/bookmarks/:id' do
    updated_title = params[:title]
    updated_url = params[:url]
    id = params[:id]
    Bookmark.update(updated_title, updated_url, id)
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
