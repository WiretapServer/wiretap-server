# Score Class
class Score < Sequel::Model
  plugin :validation_helpers
  plugin :timestamps, :update_on_create => true

  # Validation
  def validate
    super
    validates_presence [:name]
    validates_unique([:name, :leaderboard]) # Only allow 1 score per user per leaderboard
  end

  # Relations
  many_to_one  :leaderboard
  many_to_one  :user
end
