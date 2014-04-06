class Device
  include DataMapper::Resource

  property :id, Serial
  property :platform, String
  property :device_token, String
  property :created_at, DateTime
  property :updated_at, DateTime

  belongs_to :user
  belongs_to :channel

end
