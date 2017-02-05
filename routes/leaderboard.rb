class WiretapServer < Sinatra::Application
  namespace '/api' do

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
          :leaderboard_name => data["name"],
          :leaderboard_type => data["type"],
          :reverse => data["reverse"]
        })
      return jr(201, "New Leaderboard Created: " << lb[:id].to_s)
    end

    get "/leaderboards/:id.json" do
      score_list = Score.find(:leaderboard => Leaderboard[:id])
      # TODO:
      # - Paginate results
      return jr(200, {:response =>score_list.values})
    end

    post "/leaderboards/:id/score.json" do
      user_protected!
      user = get_user

      request.body.rewind
      data = JSON.parse request.body.read

      # TODO:
      # - Validate score based on type and ordering
      score = Score.find_or_create(
        :user => user,
        :leaderboard => Leaderboard[params[:id]]
      )

      score[:score] = data["score"]
      score[:country] = data["country"] if data["country"]
      score[:city] = data["city"] if data["city"]

      score.save()

      return jr(201, "Score Created!")
    end
    
  end
end
