# If table doesn't exist, create it
DB.create_table? :users do
  primary_key :id

  String  :email
  String  :name
  String  :password
  String  :password_salt
  String  :session_token

  Timestamp  :created_at
  Timestamp  :updated_at

end


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
  one_to_many :hubs
  one_to_many :scores

  # # Standard User Stuff
  # property :id, Serial
  # property :created_at, DateTime
  # property :updated_at, DateTime
  # property :username, String
  # property :password, BCryptHash
  # property :email, String, :required => true, :unique => true, :format => :email_address
  # property :email_verified, Boolean, :default => false
  # property :facebook_id, String
  # property :facebook_auth_token, String
  # property :session_key, String
  #
  # # Game Stuff
  # property :level, Integer
  # property :xp, Integer
  # property :energy, Integer
  # property :credits, Integer
  # property :platinum, Integer
  # property :notoriety, Integer
  # property :items, Object
  # property :achievements, Object
  # property :quests, Object

end
