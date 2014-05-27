class WiretapServer < Sinatra::Application

  get "/leaderboards.json" do
    return jr(200, "Leaderboards list")
  end

  get "/leaderboards/:id.json" do
    return jr(200, "Leaderboard " << params[:id])
  end

end
