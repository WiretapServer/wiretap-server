require 'sidekiq'
require 'rest_client'

# Push Notifications Sidekiq worker
class PushWorker
  include Sidekiq::Worker

  def perform(device, message)
    puts "Device: " << device["platform_type"] << "@" << device["device_identifier"] << " Message: " << message.to_s

    case device["platform_type"]
    when "webhook"
      response = RestClient.post device["device_identifier"], message.to_json, :content_type => :json
    else
      puts "Unsupported platform"
    end
  end
end
