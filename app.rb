ENV["RACK_ENV"] = "development"

require 'sinatra'
require_relative './models/bookmark'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!

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
