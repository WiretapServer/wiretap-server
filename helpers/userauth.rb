require 'SecureRandom'

module UserAuth
  def gen_token(user)
    p "Generating session token for user: " << user[:name]
    st = SecureRandom.hex(16)
    user[:session_token] = st
    user.save()
    return st
  end
end
