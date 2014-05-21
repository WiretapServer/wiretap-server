require './wiretap_server'
require 'rack/test'
require 'minitest'
require 'minitest/autorun'

set :environment, :test

class WiretapServerTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_it_replies_with_pong
    get '/ping'
    assert last_response.ok?
    assert_equal 'Pong', last_response.body
  end

  # def test_get_about_ccd
  #   get '/about/ccd'
  #   assert last_response.ok?
  #   response = JSON.parse(last_response.body)
  #   assert_equal "What is the CCD?", response[0]["title"]
  # end
  #
  # def test_get_about_corona
  #   get '/about/corona'
  #   assert last_response.ok?
  #   response = JSON.parse(last_response.body)
  #   assert_equal "Corona Labs is re-inventing how the world builds mobile apps", response[0]["title"]
  # end
  #
  # def test_get_study_outline
  #   get '/study/outline'
  #   assert last_response.ok?
  #   response = JSON.parse(last_response.body)
  #   assert_equal "First paragraph of the study outline", response[0]["title"]
  # end
  #
  # def test_get_study_categories
  #   get '/study/categories'
  #   assert last_response.ok?
  #   response = JSON.parse(last_response.body)
  #   assert_equal "The Basics", response[0]["category"]
  # end
end
