require 'sidekiq'
require_relative '../helpers/webhook.rb'

# Push Notifications Sidekiq worker
class PushWorker
  include Sidekiq::Worker

  def perform(device, message)
    puts "Device: " << device["platform_type"] << "@" << device["device_identifier"] << " Message: " << message.to_s

    case device["platform_type"]
    when "webhook"
      WebHook.send_message(device["device_identifier"], message)
    else
      puts "Unsupported platform"
    end
  end
end
