class WiretapServer < Sinatra::Application

  get "/leaderboards.json" do
    lb_list = Array.new
    # Iterate across resulting data set and insert values
    Leaderboard.dataset.each{ |row|
      lb_list.insert(-1, row.values)
    }
    response = {:leaderboards => lb_list}
    return jr(200, response)
  end

  post "/leaderboards.json" do
    admin_protected!

    request.body.rewind
    data = JSON.parse request.body.read

    lb = Leaderboard.create({
        :name => data["name"],
        :type => data["type"],
        :reverse => data["reverse"]
      })
    return jr(201, "New Leaderboard Created: " << lb[:id].to_s)
  end

  get "/leaderboards/:id.json" do
    return jr(200, "Leaderboard " << params[:id])
  end

  post "/leaderboards/:id/score.json" do
    # Score submission
    return jr(201, "Score Created!")
  end
end
