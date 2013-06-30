class Achievement
  include DataMapper::Resource

  property :id, Serial
  property :created_at, DateTime
  property :updated_at, DateTime
  property :name, String
  property :locked_description, Text
  property :unlocked_description, Text
  property :points, Integer
  property :progress_based, Boolean
  property :image, URI
  property :hidden, Boolean

  has n, :rewards, 'Item'
end