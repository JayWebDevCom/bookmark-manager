require 'sinatra'
require_relative './models/bookmark'
require 'database_cleaner'

class BookmarkManager < Sinatra::Application

  def get_all_bookmarks
    @bookmarks = Bookmark.all
  end

  get '/' do
    erb(:index)
  end

  get '/links' do
    get_all_bookmarks
    erb(:'links/index')
  end

  get '/links/new' do
    erb(:'links/new')
  end

  post '/links' do
    Bookmark.create(:name => params[:name], :address => params[:address])
    redirect '/links'
  end


end
