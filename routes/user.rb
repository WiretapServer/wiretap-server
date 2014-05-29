# encoding: utf-8

require 'bcrypt'

class WiretapServer < Sinatra::Application

  def check_login
    # TODO:
    # - Lookup user based on Email
    # - Hash provided password and compare to stored
    # - If good, return user ID
    # - Else, return error
  end

  post "/user/signup.json" do
    request.body.rewind
    data = JSON.parse request.body.read

    # Need to hash password and save to db
    password_hash = BCrypt::Password.create(data['password'])

    # Create the user
    user = User.create({
        :name => data['name'],
        :password => password_hash,
        #:password_salt => password_salt,
        :email => data['email'].downcase
      })
    return 201, "User Created: " << user[:id].to_s
  end

  post "/user/login.json" do
    # TODO:
    # - If good, return session token
    # - Else return error

    request.body.rewind
    data = JSON.parse request.body.read

    # Retrieve user
    user = User.first(:email => data['email'])

    if user && BCrypt::Password.new(user[:password]) == data['password']
      # TODO:
      # - Generate & save new session token
      # - Return new session token
      res_hash = Hash.new
      res_hash[:user_id] = user[:id]

      # Generate new session_token
      res_hash[:session_token] = gen_token(user)

      return jr(200, res_hash)
    else
      return jr(403, "Username or Password is incorrect.")
    end
  end

  get "/user/logout.json" do
    # TODO:
    # - Delete session
    user_protected!
    user = get_user
    user[:session_token] = nil
    user.save

    return jr(200, "Successfully logged out!")
  end

  get "/user/ping.json" do
    user_protected!
    return 200
  end

end
