class WiretapServer < Sinatra::Application

  get "/version.json" do
    return 200, {response: "Wiretap Server 0.1"}.to_json
  end

  get "/time.json" do
    content_type :json
    return 200, tick.to_json
  end

  get "/ping.json" do
    content_type :json
    return 200, {response: "Pong!"}.to_json
  end

  get "/info.json" do
    content_type :json
    return 200, {response: "Wiretap Server 0.1"}.to_json
  end
end
