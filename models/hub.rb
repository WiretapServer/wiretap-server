#class Hub
  #include DataMapper::Resource

  #property :id, Serial
  #property :created_at, DateTime
  #property :updated_at, DateTime
  #property :hostname, String
  #property :description, Text
  #property :ip_address, IPAddress
  #property :location, String #TODO: Check out PostGIS

  #has n, :nodes
#end
