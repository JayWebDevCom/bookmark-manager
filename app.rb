require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Application

  enable :sessions
  set :session_secret, 'super_secret'
  register Sinatra::Flash

  def get_all_bookmarks
    @bookmarks = Bookmark.all
  end

  get "/users/new" do
    @user = User.new
    erb :'users/new'
  end

  post "/users" do
    @user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:checkpassword])

    if @user.save
      session[:user_id] = @user.id
      redirect "/links"
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end

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
      params[:tags].split.each { |tag|
        bookmark.tags << Tag.first_or_create(name: tag)
      }
    bookmark.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @bookmarks = tag ? tag.bookmarks : []
    erb :'links/index'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/links'
    else
      flash.now[:errors] = 'The email or password is incorrect'
      erb :'sessions/new'
    end
  end

end
