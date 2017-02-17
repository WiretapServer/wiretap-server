# Score Class
class Score < Sequel::Model
  plugin :validation_helpers
  plugin :timestamps, :update_on_create => true, :update=>:updated_at

  # Validation
  def validate
    super
    validates_presence [:user]
    validates_unique([:user, :leaderboard]) # Only allow 1 score per user per leaderboard
  end

  # Relations
  many_to_one  :leaderboard
  many_to_one  :user

  def self.upsert(args)
    s = self.find_or_create(user: args[:user], leaderboard: args[:leaderboard]) do |score|
      score.value = args[:value] 
      return
    end
    s.update(value: args[:value]) if s.better_score?(args[:value])
  end

  def better_score?(new_value)
    case leaderboard.reverse
    when true
      return new_value < value
    else
      return new_value > value
    end
  end
end
