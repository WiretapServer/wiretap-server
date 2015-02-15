require 'rest_client'

module WebHook
  # Makes a http request to the target endpoint passing contents as data
  def self.send_message(endpoint, content)
    # TODO:
    # - Make webrequest
    # - If success return success
    # - If error, return error
    response = RestClient.post endpoint, content.to_json, :content_type => :json

    return response.code, response
  end

  def self.prune_devices
    # Checks failed endpoints
    # removes "dead" endpoints
  end


  
end
