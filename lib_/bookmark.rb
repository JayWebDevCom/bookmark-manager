require "data_mapper"
require "dm-postgres-adapter"

class Bookmark

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :address, String

end
