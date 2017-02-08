#class PushMessage
  #include DataMapper::Resource

  #property :id, Serial
  #property :alert, String
  #property :badge, Integer
  #property :sound, String
  #property :content_available, Boolean, :default => false
  #property :payload, Text
  #property :action, String
  #property :title, String
  #property :created_at, DateTime
  #property :updated_at, DateTime

  #has n, :devices, 'Device'
  #has n, :channels, 'Channel'

#end
