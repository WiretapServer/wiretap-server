#require './wiretap_server'
#run Sinatra::Application

#require 'bundler/setup'


root = ::File.dirname(__FILE__)
require ::File.join( root, 'wiretap_server' )
run WiretapServer.new