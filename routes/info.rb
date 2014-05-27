class WiretapServer < Sinatra::Application

  get "/time.json" do
    return jr(200, tick)
  end

  get "/ping.json" do
    return jr(200, "Pong!")
  end

  get "/info.json" do
    info = Hash.new
    info[:version] = SERVER_VERSION
    info[:server] = SERVER_NAME
    return jr(200, info)
  end
end
