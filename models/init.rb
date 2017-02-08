require 'sequel'
require 'pg'

if ENV['RACK_ENV'] == 'production'
  DB = Sequel.connect(ENV['DATABASE_URL'])
elsif ENV['RACK_ENV'] == 'staging'
  DB = Sequel.connect(ENV['DATABASE_URL_STAGING'])
else
  DB = Sequel.sqlite(ENV['DATABASE_URL_DEV'])
end

# Recursively require files
Dir[File.join(".", "./models/*.rb")].each do |f|
  require f
end
