require './wiretap_server'
require 'rack/test'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/hooks/default'
require 'minitest/ci'
require 'sequel'
require 'pg'
require 'pry'

Sequel::Model.plugin :update_or_create

class Minitest::HooksSpec
  def around
    Sequel::Model.db.transaction(rollback: :always, auto_savepoint: true){super}
  end
end
