class WiretapServer < Sinatra::Application

  get "/admin/users.json" do
    admin_protected!
    users = User.all
    p users
    if users.empty?
      return 200, "No Users"
    else
      return 200, users.first[:name]
    end
  end
end
