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

#class Item
  #include DataMapper::Resource

  #property :id, Serial
  #property :created_at, DateTime
  #property :updated_at, DateTime
  #property :name, String
  #property :description, Text
  #property :cost_credits, Integer
  #property :cost_platinum, Integer
  #property :image, URI
  #property :min_level, Integer
  #property :ram_used, Integer
  #property :slots, Object
  #property :generation, Integer
  #property :show_in_store, Boolean
#end
