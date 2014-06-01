class WiretapServer < Sinatra::Application

  get "/achievements.json" do
    ach_list = Array.new
    # Iterate across resulting data set and insert values
    Achievement.dataset.each{ |row|
      ach_list.insert(-1, row.values)
    }
    response = {:achievements => ach_list}
    return jr(200, response)
  end

  post "/achievements.json" do
    admin_protected!

    request.body.rewind
    data = JSON.parse request.body.read

    ach = Achievement.create({
        :achievement_name => data["name"],
        :locked_description   => data["locked_description"],
        :unlocked_description => data["unlocked_description"],
        :points => data["points"],
        :image => data["image"],
        :achievement_type => data["type"],
        :hidden => data["hidden"]
      })
    return jr(201, "New Achievement Created: " << ach[:id].to_s)
  end

  get "/achievements/unlocked.json" do
    user_protected!
    user = get_user

    un_ach_list = Array.new
    UnlockedAchievement.where(:user => user).each { |row|
      un_ach_list.insert(-1, row.values)
    }

    return jr(200, {:unlocked_achievements => un_ach_list})
  end

  post "/achievements/:id/unlock.json" do
    user_protected!
    user = get_user

    request.body.rewind
    data = JSON.parse request.body.read

    # TODO:
    # - Create or Update unlocked achievement
    un_ach = UnlockedAchievement.find_or_create(
      :user => user,
      :achievement => Achievement[params[:id]],
    )

    un_ach[:progress] = data["progress"]

    un_ach.save()
    un_ach[:progress] == 100 ? response = "Achievement Unlocked" : response = "Achievement Updated"
    return jr(201, response)
  end
end
