# Leaderboard Class
class Leaderboard < Sequel::Model
  plugin :validation_helpers
  plugin :timestamps, :update_on_create => true

  # Validation
  def validate
    super
    validates_presence [:name]
    validates_unique(:name)
  end

  # Relations
  one_to_many :scores
end
