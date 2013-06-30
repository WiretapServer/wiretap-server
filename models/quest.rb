class Quest
  include DataMapper::Resource

  property :id, Serial    
  property :created_at, DateTime
  property :updated_at, DateTime
  property :name, String
  property :description, Text
  property :min_level, Integer
  property :difficulty, Integer

  has n, :rewards, 'Item'
  has n, :prerequisites, 'Item'
end