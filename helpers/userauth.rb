require 'SecureRandom'

module UserAuth

  def gen_token(user)
    p "Generating session token for user: " << user[:name]
    st = SecureRandom.hex(16)
    user[:session_token] = st
    user.save()
    return st
  end

  def get_user
    return User.find(:session_token => request.env["HTTP_X_USER_SESSION"])
  end

  def user_protected!
    return if user_authorized?
  end

  def user_authorized?
    session_token = request.env["HTTP_X_USER_SESSION"]
    user = get_user if session_token
    return true if user
  end

end
