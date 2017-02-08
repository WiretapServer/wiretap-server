#class Client
  #include DataMapper::Resource

  #property :id, Serial, :key => true
  #property :api_key, String
  #property :secret_key, BCryptHash
  #property :created_at, DateTime
  #property :updated_at, DateTime

#end
