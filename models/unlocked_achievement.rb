# Unlocked Achievements Class
class UnlockedAchievement < Sequel::Model
  plugin :validation_helpers
  plugin :timestamps, :update_on_create => true

  # Validation
  def validate
    super
    validates_presence [:user,:achievement]
    validates_unique([:user, :achievement])
  end

  # Relations
  many_to_one  :achievement
  many_to_one  :user
end
