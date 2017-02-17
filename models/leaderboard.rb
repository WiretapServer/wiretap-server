# Leaderboard Class
class Leaderboard < Sequel::Model
  plugin :validation_helpers
  plugin :timestamps, :update_on_create => true, :update=>:updated_at

  # Validation
  def validate
    super
    validates_presence [:leaderboard_name]
    validates_unique(:leaderboard_name)
  end

  # Relations
  one_to_many :scores
end
