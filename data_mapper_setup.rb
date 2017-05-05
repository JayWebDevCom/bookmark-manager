ENV['RACK_ENV'] ||= 'development'

require 'sinatra/bootstrap'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
require 'haml'

require_relative 'models/bookmark'
require_relative 'models/tag'
require_relative 'models/user'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!


  def login?
    if session[:user_id].nil?
      return false
    else
      return true
    end
  end

  def username
    return session[:username]
  end

  def current_user
   @current_user ||= User.get(session[:user_id])
 end
