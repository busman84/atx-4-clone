require 'active_record'
require 'pg'

require_relative 'sql.rb'

# ActiveRecord::Base.establish_connection(
#   adapter:  'postgresql',
#   database: 'lecture',
#   host:     'localhost'
# )
#
# require_relative 'event.rb'
# require_relative 'ticket.rb'
# require_relative 'user.rb'
#
# User.create(first_name: "Amanda", last_name: "Chang")
#
# Event.create(name: "SXSW", description: "A conference in Austin!", status: "confirmed", capacity: 5000)
# Event.create(name: "SXSW2", description: "Let's do it again!", status: "pending", capacity: 5000)
#
# Ticket.create(code: 3000, event_id: 1, user_id: 1)
# Ticket.create(code: 3000, event_id: 1, user_id: 2)
# Ticket.create(code: 3000, event_id: 1, user_id: 3)
