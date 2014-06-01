module PushRouter
  # Looks at device, then fires off notification via appropriate system
  def send_push(device, push_message)
    # TODO:
    # - Check device type
    # - Call required helper
    # - Should probably use something like sidekiq
    p "Sending push to " << device.platform_type

    case device.platform_type
    when "webhook"
      return webhook(device.device_identifier, push_message)
    else
      return 404, "unsupported platform"
    end

  end
end
