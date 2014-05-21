# WireTap Server
#
# Author: Ali Hamidi <ahamidi@me.com>
#
#

require 'sinatra'
require 'json/ext'
require 'restclient'
require 'base64'
require 'openssl'
require 'newrelic_rpm'

class WiretapServer < Sinatra::Application
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
    "Sorry! Something went wrong :( We're on it!"
    puts "Error: " + env['sinatra.error'].name
  end
end



require_relative 'models/init'
require_relative 'helpers/init'
require_relative 'routes/init'
