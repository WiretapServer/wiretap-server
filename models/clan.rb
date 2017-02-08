#class Clan
  #include DataMapper::Resource

  #property :id, Serial
  #property :created_at, DateTime
  #property :updated_at, DateTime
  #property :name, String
  #property :emblem, URI
  #property :influence, Integer

  #belongs_to :leader, 'User'
  #has n, :members, 'User'
#end
