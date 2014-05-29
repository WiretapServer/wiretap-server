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
    basic_auth ||= Rack::Auth::Basic::Request.new(request.env)
    return User.find(:session_token => basic_auth.credentials[1])
  end

  def user_protected!
    return if user_authorized?
    headers['WWW-Authenticate'] = 'Basic realm="WireTap Server"'
    halt 401, "Not authorized\n"
  end

  def user_authorized?
    basic_auth ||= Rack::Auth::Basic::Request.new(request.env)
    user = get_user if basic_auth.provided? and basic_auth.basic?
    return true if user
  end

end
