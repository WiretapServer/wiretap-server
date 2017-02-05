class WiretapServer < Sinatra::Application

  namespace '/api' do
    get "/admin/users.json" do
      admin_protected!
      users = User.all
      p users
      if users.empty?
        return 200, "No Users"
      else
        return jr(200, users.first.values)      
      end
    end
  end
end
