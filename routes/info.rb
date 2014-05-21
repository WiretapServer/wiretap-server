class WiretapServer < Sinatra::Application

  get "/time.json" do
    return jr(200, tick)
  end

  get "/ping.json" do
    return jr(200, "Pong!")
  end

  get "/info.json" do
    info = Hash.new
    info[:version] = WIRETAP_SERVER_VERSION
    info[:name] = "Wiretap Server"
    info[:author] = "Ali Hamidi"
    return jr(200, info)
  end
end
