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

  post "/user/signup?" do
    request.body.rewind
    data = JSON.parse request.body.read

    # Need to hash password and save to db
    password_salt = BCrypt::Engine.generate_salt
    password_hash = BCrypt::Engine.hash_secret(data[:password], password_salt)

    # Create the user
    user = User.create({
        :name => data['name'],
        :password => password_hash,
        :password_salt => password_salt,
        :email => data['email']
      })
    return 201, "User Created: " << user[:id].to_s
  end

  post "/user/login?" do
    # TODO:
    # - Verify password against stored
    # - If good, return session token
    # - Else return error
  end

  get "/user/logout?" do
    # TODO:
    # - Delete session
  end

  get "/user?" do
    users = User.all
    if users.empty?
      return 200, "No Users"
    else
      return 200, users.first[:name]
    end
  end

end
