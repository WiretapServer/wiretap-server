class Item
  include DataMapper::Resource

  property :id, Serial
  property :created_at, DateTime
  property :updated_at, DateTime
  property :name, String
  property :description, Text
  property :cost_credits, Integer
  property :cost_platinum, Integer
  property :image, URI
  property :min_level, Integer
  property :ram_used, Integer
  property :slots, Object
  property :generation, Integer
  property :show_in_store, Boolean
end