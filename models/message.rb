class Message
  include DataMapper::Resource

  property :id, Serial
  property :created_at, DateTime
  property :updated_at, DateTime  
  property :content, Text
  property :read, Boolean

  belongs_to :from, 'User'
  belongs_to :to, 'User'
end