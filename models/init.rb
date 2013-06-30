require 'data_mapper'
require 'dm-core'
require 'dm-migrations'
require 'dm-types'
require 'dm-timestamps'

DataMapper.setup(:default, ENV["DATABASE_URL"])

require_relative 'user'
require_relative 'quest'
require_relative 'item'
require_relative 'achievement'
require_relative 'leaderboard'
require_relative 'score'
require_relative 'product'
require_relative 'message'
require_relative 'clan'
require_relative 'node'
require_relative 'hub'

DataMapper.finalize
DataMapper.auto_upgrade!