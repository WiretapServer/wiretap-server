# WireTap Server
#
# Author: Ali Hamidi <ahamidi@me.com>
#
#

require 'sinatra/base'
require 'sinatra/namespace'
require 'json/ext'
require 'restclient'
require 'base64'
require 'openssl'
require 'newrelic_rpm'
require 'sequel'
require 'pg'

SERVER_VERSION = "0.1"
SERVER_NAME = "Wiretap Server"

class WiretapServer < Sinatra::Application
  register Sinatra::Namespace
  enable :sessions
  set :session_secret, 'fzyv4w4B61TQx6G'

  configure :production do
    #set :haml, { :ugly=>true }
    set :clean_trace, true
  end

  configure :development do
    # ...
  end

  not_found do
    'This is nowhere to be found.'
  end

  error do
    puts "Error: " + env['sinatra.error'].name.to_s
    "Sorry! Something went wrong :( We're on it!"
  end
end

# Configure Database
Sequel::Model.plugin :update_or_create
DB = Sequel.connect(ENV['DATABASE_URL'])

# Load Models
Dir[File.join(".", "./models/*.rb")].each do |f|
  require f
end

# Load Routes
Dir[File.join(".", "./routes/*.rb")].each do |f|
  require f
end

# Load Helpers
require_relative 'helpers/init'
