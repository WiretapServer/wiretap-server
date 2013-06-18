# IBT VPS Manager Web Service
#
# Author: Ali Hamidi <ahamidi@me.com>
#
#

require 'sinatra'
require 'json/ext'
require 'restclient'
require 'base64'
require 'openssl'
require 'data_mapper'
require 'dm-core'
require 'dm-migrations'
require 'dm-types'
require 'dm-timestamps'
#require 'redis'

# Configuration
configure do
  	DataMapper.setup(:default, ENV["DATABASE_URL"])
    redis_uri = URI.parse(ENV["REDISCLOUD_URL"])
    #set :redis, redis = Redis.new(:host => redis_uri.host, :port => redis_uri.port, :password => redis_uri.password)
end

# Helpers
helpers do
  def check_auth(token)
    # TODO: Check auth_token in Redis
  end

  def do_web_request(path, params)
    # Inject client id and api key
    params = Hash.new
    params["client_id"] = settings.client_id
    params["api_key"] = settings.api_key

    url = settings.do_url + path
    if params
      response = RestClient.get url, {:params => params}
    else
      response = RestClient.get url
    end
    return response
  end
end

# Data Mapper Models
class User
  include DataMapper::Resource

  # Standard User Stuff
  property :id, Serial
  property :created_at, DateTime
  property :updated_at, DateTime
  property :username, String
  property :password, BCryptHash
  property :email, String, :required => true, :unique => true, :format => :email_address
  property :email_verified, Boolean, :default => false
  property :facebook_id, String
  property :facebook_auth_token, String

  # Game Stuff
  property :level, Integer
  property :xp, Integer
  property :energy, Integer
  property :credits, Integer
  property :platinum, Integer
  property :notoriety, Integer
  property :items, Object
  property :achievements, Object
  property :quests, Object

  # Relations
  has n, :hubs
  has n, :scores
end

class Quest
  include DataMapper::Resource

  property :id, Serial    
  property :created_at, DateTime
  property :updated_at, DateTime
  property :name, String
  property :description, Text
  property :min_level, Integer
  property :difficulty, Integer

  has n, :rewards, 'Item'
  has n, :prerequisites, 'Item'
end

class Item
  include DataMapper::Resource

  property :id, Serial
  property :created_at, DateTime
  property :updated_at, DateTime
  property :name, String
  property :description, Text
  property :cost_credits, Integer
  property :cost_platinum, Integer
  property :image, URI
  property :min_level, Integer
  property :ram_used, Integer
  property :slots, Object
  property :generation, Integer
  property :show_in_store, Boolean
end

class Achievement
  include DataMapper::Resource

  property :id, Serial
  property :created_at, DateTime
  property :updated_at, DateTime
  property :name, String
  property :locked_description, Text
  property :unlocked_description, Text
  property :points, Integer
  property :progress_based, Boolean
  property :image, URI
  property :hidden, Boolean

  has n, :rewards, 'Item'
end

class Leaderboard
  include DataMapper::Resource

  property :id, Serial
  property :created_at, DateTime
  property :updated_at, DateTime
  property :name, String
  property :reverse, Boolean
  property :geography, String

  has n, :scores
end

class Score
  include DataMapper::Resource

  property :id, Serial
  property :created_at, DateTime
  property :updated_at, DateTime
  property :value, Integer

  belongs_to :leaderboard
  belongs_to :user
end

class Product
  include DataMapper::Resource

  property :id, Serial
  property :created_at, DateTime
  property :updated_at, DateTime
  property :download, URI
  property :image, URI
  property :ordering, Integer
  property :product_identifier, String
  property :title, String
  property :subtitle, String
end

class Message
  include DataMapper::Resource

  property :id, Serial
  property :created_at, DateTime
  property :updated_at, DateTime  
  property :content, Text
  property :read, Boolean

  belongs_to :from, 'User'
  belongs_to :to, 'User'
end

class Clan
  include DataMapper::Resource

  property :id, Serial
  property :created_at, DateTime
  property :updated_at, DateTime
  property :name, String
  property :emblem, URI
  property :influence, Integer

  belongs_to :leader, 'User'
  has n, :members, 'User'
end

class Node
  include DataMapper::Resource

  property :id, Serial
  property :created_at, DateTime
  property :updated_at, DateTime
  property :hostname, String
  property :ip_address, IPAddress
  property :private, Boolean
  property :location, String #TODO: Check out PostGIS
  property :specs, Object
  property :value, Integer
  property :protected_until, DateTime

  belongs_to :owner, 'User'
end

class Hub
  include DataMapper::Resource

  property :id, Serial
  property :created_at, DateTime
  property :updated_at, DateTime
  property :hostname, String
  property :description, Text
  property :ip_address, IPAddress
  property :location, String #TODO: Check out PostGIS

  has n, :nodes
end

DataMapper.finalize
DataMapper.auto_upgrade!

# Routes
get '/?' do
	200
end

get '/ping/?' do
  "Pong"
end

post '/register/?' do
  # @customer = Customer.new(
  #     :first_name => request['first_name'],
  #     :last_name => request['last_name'],
  #     :email => request['email'],
  #     :password => request['password']
  #   )
  # @customer.save
end

get '/login/?' do
  # c = Customer.first(:email => request['email'])
  # #puts "Email: " + request['email']
  # if c.password == request['password']
  #   # TODO: Create auth token and save in Redis with TTL
  # else
  #   logger.error "Login Failed!"
  #   return [401, "Invalid Email Address and Password Combination"]
  # end
end

get '/show_all/?' do
  # response = do_web_request("droplets/",nil)
  # logger.info response
end

error do
  "Sorry! Something went wrong :( We're on it!"
  puts "Error: " + env['sinatra.error'].name
end

