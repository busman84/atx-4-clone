require 'active_record'
require 'pg'

require_relative 'sql.rb'

ActiveRecord::Base.establish_connection(
  adapter:  'postgresql',
  database: 'lecture',
  host:     'localhost'
)
