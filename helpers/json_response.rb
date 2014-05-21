module JsonResponse
  # Takes the response, packages as JSON and embeds server tick
  def jr(status, response)
    content_type :json
    res_hash = Hash.new()
    res_hash[:response] = response
    res_hash[:time] = tick()
    return status, res_hash.to_json
  end
end
