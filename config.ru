
root = ::File.dirname(__FILE__)
require ::File.join( root, 'wiretap_server' )
run WiretapServer.new
