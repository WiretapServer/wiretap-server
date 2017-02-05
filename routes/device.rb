class WiretapServer < Sinatra::Application

  namespace '/api' do
    get "/devices.json" do
      admin_protected!

      device_list = Array.new
      # Iterate across resulting data set and insert values
      Device.dataset.each{ |row|
        device_list.insert(-1, row.values)
      }
      response = {:devices => device_list}
      return jr(200, response)
    end

    post "/devices.json" do
      user_protected!
      user = get_user

      request.body.rewind
      data = JSON.parse request.body.read

      device = Device.create({
          :user => user,
          :platform_type => data["type"],
          :device_identifier => data["device_identifier"],
          :status => "active"
        })
      return jr(201, "New Device Registered: " << device[:id].to_s)
    end

    delete "/devices.json" do
      user_protected!
      user = get_user

      # TODO:
      # - Find the device
      # - Mark as inactive
    end

    post "/users/:id/push.json" do
      admin_protected!

      request.body.rewind
      data = JSON.parse request.body.read

      send_push(User[params[:id]], data)
      return 200
    end
  end
end
