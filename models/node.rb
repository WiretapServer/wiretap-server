#class Node
  #include DataMapper::Resource

  #property :id, Serial
  #property :created_at, DateTime
  #property :updated_at, DateTime
  #property :hostname, String
  #property :ip_address, IPAddress
  #property :private, Boolean
  #property :location, String #TODO: Check out PostGIS
  #property :specs, Object
  #property :value, Integer
  #property :protected_until, DateTime

  #belongs_to :owner, 'User'
#end
