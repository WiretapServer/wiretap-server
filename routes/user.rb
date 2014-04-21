# encoding: utf-8
class WiretapServer < Sinatra::Application

  def check_login
    # TODO:
  end

  post "/user/signup?" do
    user = User.create(:name => 'Ali Hamidi', :password => 'passw0rd')
    return 201, "User Created: " << user.name
  end

  post "/user/login?" do
    # Define your own check_login
    if user = check_login
      # TODO: Save session key to user
    else
      # TODO: Return Error
    end
  end

  get "/user/logout?" do
    # TODO
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
