require 'active_record'

require_relative 'models/city'
require_relative 'models/country'
require_relative 'models/country_language'

# Establish a connection to our local `world` database
ActiveRecord::Base.establish_connection(
  adapter:  'postgresql',
  host:     'localhost',
  username: 'mikedang',
  password: '',
  database: 'world_development'
)