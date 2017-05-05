class Bookmark

  include DataMapper::Resource

  has n, :tags, through: Resource
  property :id, Serial
  property :name, String
  property :address, String

end
