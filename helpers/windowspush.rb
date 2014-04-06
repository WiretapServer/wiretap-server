module WindowsPush
  def api_protected!
    return if api_authorized?
    headers['WWW-Authenticate'] = 'Basic realm="WireTap Server"'
    halt 401, "Not authorized\n"
  end

  def api_authorized?
    @api_auth ||=  Rack::Auth::Basic::Request.new(request.env)
    @api_auth.provided? and @api_auth.basic? and @api_auth.credentials and @api_auth.credentials == ['admin', 'admin']
  end
end
