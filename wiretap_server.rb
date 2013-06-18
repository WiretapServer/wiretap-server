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
require 'redis'

# Configuration
configure do
  	DataMapper.setup(:default, ENV["DATABASE_URL"])
    redis_uri = URI.parse(ENV["REDISCLOUD_URL"])
    set :redis, redis = Redis.new(:host => redis_uri.host, :port => redis_uri.port, :password => redis_uri.password)
    set :do_url, "https://api.digitalocean.com/"
    set :client_id, ENV["CLIENT_ID"]
    set :api_key, ENV["API_KEY"]
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
class Customer
  include DataMapper::Resource

  property :id, Serial    
  property :first_name, String    
  property :last_name, String
  property :email, String, :required => true, :unique => true, :format => :email_address
  property :validated, Boolean, :default => false
  property :created_at, DateTime
  property :password, BCryptHash

  has n, :servers
  has n, :invoices
end

class Server
  include DataMapper::Resource

  property :id, Serial
  property :remote_id, Integer
  property :created_at, DateTime

  belongs_to :customer
end

class Invoice
  include DataMapper::Resource

  property :id, Serial
  property :customer, Integer
  property :paid, Boolean, :default => false
  property :amount, Float
  property :created_at, DateTime

  belongs_to :customer
end

DataMapper.finalize
require  'dm-migrations'
DataMapper.auto_upgrade!

# Routes
get '/?' do
	200
end

get '/ping/?' do
  "Pong"
end

post '/register/?' do
  @customer = Customer.new(
      :first_name => request['first_name'],
      :last_name => request['last_name'],
      :email => request['email'],
      :password => request['password']
    )
  @customer.save
end

get '/login/?' do
  c = Customer.first(:email => request['email'])
  #puts "Email: " + request['email']
  if c.password == request['password']
    # TODO: Create auth token and save in Redis with TTL
  else
    logger.error "Login Failed!"
    return [401, "Invalid Email Address and Password Combination"]
  end
end

get '/show_all/?' do
  response = do_web_request("droplets/",nil)
  logger.info response
end

error do
  "Sorry! Something went wrong :( We're on it!"
  puts "Error: " + env['sinatra.error'].name
end

