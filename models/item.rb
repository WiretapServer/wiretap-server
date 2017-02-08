# Item Class
class Item < Sequel::Model
  plugin :validation_helpers
  plugin :timestamps, :update_on_create => true

  # Validation
  def validate
    super
    validates_presence [:name]
    validates_unique(:name)
  end

  # Relations
  #one_to_many :items #Might want to award items on unlock
end
