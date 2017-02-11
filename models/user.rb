require 'securerandom'

# User Class
class User < Sequel::Model
  plugin :validation_helpers
  plugin :timestamps, :update_on_create => true

  # Validation
  def validate
    super
    validates_presence [:email]
    validates_unique :email
  end

  # Relations
  one_to_many :scores
  one_to_many :unlocked_achievements

  def password=(password)
    self.password_salt = SecureRandom.base64(16)
    super(BCrypt::Password.create(password+password_salt))
  end

  def check_password(check_password)
    BCrypt::Password.new(password) == check_password + password_salt
  end

  def login
    update(session_token: gen_session_token)
    self.session_token
  end

  def logout
    update(session_token: nil) 
  end

  private

  def gen_session_token
    SecureRandom.hex(16)
  end
end
