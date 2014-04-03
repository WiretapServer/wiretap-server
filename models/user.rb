class User
  include DataMapper::Resource

  # Standard User Stuff
  property :id, Serial
  property :created_at, DateTime
  property :updated_at, DateTime
  property :username, String
  property :password, BCryptHash
  property :email, String, :required => true, :unique => true, :format => :email_address
  property :email_verified, Boolean, :default => false
  property :facebook_id, String
  property :facebook_auth_token, String
  property :session_key, String

  # Game Stuff
  property :level, Integer
  property :xp, Integer
  property :energy, Integer
  property :credits, Integer
  property :platinum, Integer
  property :notoriety, Integer
  property :items, Object
  property :achievements, Object
  property :quests, Object

  # Relations
  has n, :hubs
  has n, :scores
end