class Score
  include DataMapper::Resource

  property :id, Serial
  property :created_at, DateTime
  property :updated_at, DateTime
  property :value, Integer

  belongs_to :leaderboard
  belongs_to :user
end