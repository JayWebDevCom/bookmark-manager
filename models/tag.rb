class Tag
  include DataMapper::Resource

  has n, :bookmarks, through: Resource

  property :id, Serial
  property :name, String
end
