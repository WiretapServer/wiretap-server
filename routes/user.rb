# encoding: utf-8
class WiretapServer < Sinatra::Application

  def check_login do
    # TODO:
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
end
