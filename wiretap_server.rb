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

  helpers do
    #include Rack::Utils
    #alias_method :h, :escape_html
  end

  not_found do
    'This is nowhere to be found.'
  end

  error do
    puts "Error: " + env['sinatra.error'].name
    "Sorry! Something went wrong :( We're on it!"
  end
end



require_relative 'models/init'
require_relative 'helpers/init'
require_relative 'routes/init'
