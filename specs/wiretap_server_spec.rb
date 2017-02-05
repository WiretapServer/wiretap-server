require './wiretap_server'
require 'rack/test'
require 'minitest'
require 'minitest/autorun'

#set :environment, :test

class WiretapServerTest < Minitest::Test
  include Rack::Test::Methods

  def app
    #Sinatra::Application
    WiretapServer.new
  end

  def test_it_replies_with_pong
    get '/ping.json'
    assert last_response.ok?
    res = JSON.parse(last_response.body)
    assert_equal 'Pong!', res["response"]
  end

  def test_it_replies_with_version
    get '/version.json'
    assert last_response.ok?
    res = JSON.parse(last_response.body)
    assert_equal 'Wiretap Server 0.1', res["response"]
  end

end
