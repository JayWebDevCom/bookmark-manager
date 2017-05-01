require 'sinatra'
require_relative './models/bookmark'

class BookmarkManager < Sinatra::Application

  get '/' do
    erb(:index)
  end

  get '/links' do
    @bookmarks = Bookmark.all
    erb(:'links/index')
  end

end
