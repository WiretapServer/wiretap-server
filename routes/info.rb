class WiretapServer < Sinatra::Application

  get "/version.json" do
    return 200, "Wiretap Server 0.1"
  end

  get "/time.json" do
    content_type :json
    return 200, tick.to_json
  end

  get "/ping.json" do
    return 200, "Pong!"
  end
end
