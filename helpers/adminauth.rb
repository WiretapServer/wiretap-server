module AdminAuth
  def admin_protected!
    return if api_authorized?
    headers['WWW-Authenticate'] = 'Basic realm="WireTap Server"'
    halt 401, "Not authorized\n"
  end

  def admin_authorized?
    @admin_auth ||=  Rack::Auth::Basic::Request.new(request.env)
    @admin_auth.provided? and @admin_auth.basic? and @admin_auth.credentials and @admin_auth.credentials == ['admin', 'admin']
  end
end
