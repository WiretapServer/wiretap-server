# Message Class
class Message < Sequel::Model
  plugin :validation_helpers
  plugin :timestamps, :update_on_create => true, :update=>:updated_at

  many_to_one :from, class: :User, key: :from_id
  many_to_one :to, class: :User, key: :to_id

  def validate
    super
    validates_presence [:from, :to, :content]
  end

  def mark_as_read
    self.read = true
    save_changes
  end
end
