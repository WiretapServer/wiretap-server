# User Class
class User < Sequel::Model
  plugin :validation_helpers
  plugin :timestamps, :update_on_create => true

  # Validation
  def validate
    super
    validates_presence [:email]
    validates_unique(:email)
  end

  # Relations
  #one_to_many :hubs
  one_to_many :scores
end
