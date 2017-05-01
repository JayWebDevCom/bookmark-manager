require 'sinatra'
require_relative './models/bookmark'

class BookmarkManager < Sinatra::Application

  get '/' do
    @bookmarks = Bookmark.all
    erb(:index)
  end

end
