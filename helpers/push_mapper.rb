require_relative '../workers/push_worker'

module PushMapper
  # Takes user as input and outputs notifications to each of their devices
  def send_push(user, push_message)

    # Get the user's device(s)
    device_list = Device.where(:user => User[:id]).each { |row|
      p row.inspect()
      PushWorker.perform_async(row.to_hash, push_message)
    }

    return true
  end
end
