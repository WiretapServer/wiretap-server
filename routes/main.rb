# encoding: utf-8
class WiretapServer < Sinatra::Application
  get "/" do
    @title = "Welcome to MyApp"        
    #haml :main
  end
end