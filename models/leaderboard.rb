class Leaderboard
  include DataMapper::Resource

  property :id, Serial
  property :created_at, DateTime
  property :updated_at, DateTime
  property :name, String
  property :reverse, Boolean
  property :geography, String

  has n, :scores
end