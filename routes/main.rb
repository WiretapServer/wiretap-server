# encoding: utf-8
class WiretapServer < Sinatra::Application
  get "/" do
    #@title = "Welcome to MyApp"        
    #haml :main
    send_file File.expand_path('index.html', settings.public_folder)
  end
end