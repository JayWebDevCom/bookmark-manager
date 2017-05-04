ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

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
    bookmark = Bookmark.create(:name => params[:name], :address => params[:address])
    tag  = Tag.first_or_create(name: params[:tags])  # 2. Create a tag for the link
    bookmark.tags << tag                       # 3. Adding the tag to the link's DataMapper collection.
    bookmark.save                              # 4. Saving the link.
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @bookmarks = tag ? tag.bookmarks : []
    erb :'links/index'
  end


end
