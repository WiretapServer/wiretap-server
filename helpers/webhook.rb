module WebHook
  # Makes a http request to the target endpoint passing contents as data
  def webhook(endpoint, content)
    content_type :json
    # TODO:
    # - Make webrequest
    # - If success return success
    # - If error, return error
    return 200
  end
end
