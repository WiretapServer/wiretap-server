require 'sequel'
require 'pg'

if ENV['RACK_ENV'] == 'production'
  DB = Sequel.connect(ENV['DATABASE_URL'])
else
  DB = Sequel.sqlite(ENV['DATABASE_URL_DEV'])
end

require_relative 'user'
# require_relative 'quest'
# require_relative 'item'
require_relative 'achievement'
require_relative 'unlocked_achievement'
require_relative 'leaderboard'
require_relative 'score'
# require_relative 'product'
# require_relative 'message'
# require_relative 'clan'
# require_relative 'node'
# require_relative 'hub'
# require_relative 'client'
# require_relative 'channel'
# require_relative 'push_message'
# require_relative 'device'
