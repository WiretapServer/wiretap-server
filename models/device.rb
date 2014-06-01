# Device Class
class Device < Sequel::Model
  plugin :validation_helpers
  plugin :timestamps, :update_on_create => true

  # Validation
  def validate
    super
    validates_presence [:user_id, :device_identifier]
    validates_unique([:user_id, :device_identifier])
  end

  # Relations
  many_to_one :user
end
