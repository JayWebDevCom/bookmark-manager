require "data_mapper"

class Bookmark

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :address, String

end
