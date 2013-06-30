class Product
  include DataMapper::Resource

  property :id, Serial
  property :created_at, DateTime
  property :updated_at, DateTime
  property :download, URI
  property :image, URI
  property :ordering, Integer
  property :product_identifier, String
  property :title, String
  property :subtitle, String
end