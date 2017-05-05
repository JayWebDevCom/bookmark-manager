require 'bcrypt'
require "data_mapper"

class User < ActiveRecord::Base

  include DataMapper::Resource
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
