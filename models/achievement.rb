# Achievements Class
class Achievement < Sequel::Model
  plugin :validation_helpers
  plugin :timestamps, :update_on_create => true

  module Type
    BOOLEAN = 1
    PROGRESS = 2
  end

  # Validation
  def validate
    super
    validates_presence [:achievement_name]
    validates_unique(:achievement_name)
    validates_presence [:achievement_type]
  end

  # Relations
  #one_to_many :items #Might want to award items on unlock
  
  def unlock(user:, progress: 100)
    progress = 100 unless achievement_type == Achievement::Type::PROGRESS
    UnlockedAchievement.update_or_create(user: user, achievement: self) do |ach|
      ach.update(progress: progress)
    end
  end
end
