# encoding: utf-8
class WiretapServer < Sinatra::Application
  get "/ping/?" do
    status 200
    "Pong!"
  end

  # post "/login" do
  #   # Define your own check_login
  #   if user = check_login
  #     session[ :user ] = user.pk
  #     redirect '/'
  #   else
  #     redirect '/login'
  #   end
  # end

  # get "/logout" do
  #   session[:user] = session[:pass] = nil
  #   redirect '/'
  # end
end