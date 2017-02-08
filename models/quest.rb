# Quest Class
class Quest < Sequel::Model
  plugin :validation_helpers
  plugin :timestamps, :update_on_create => true

  
  # Validation
  def validate
    super
    validates_presence [:name]
    validates_presence [:description]
    validates_unique(:name)
  end

  # Relations
  one_to_many :rewards, class: :Item
  one_to_many :prerequisites, class: :Item

end


  #property :id, Serial    
  #property :created_at, DateTime
  #property :updated_at, DateTime
  #property :name, String
  #property :description, Text
  #property :min_level, Integer
  #property :difficulty, Integer
