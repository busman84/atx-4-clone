require 'httparty'
require 'json'

# Use the class methods to get down to business quickly
response = HTTParty.get('http://api.openweathermap.org/data/2.5/weather?id=4254010&units=imperial&APPID=33814a2cc7924300317c3f625816be07')

#puts response.body, response.code, response.message, response.headers.inspect
buffer = response.body
result = JSON.parse(buffer)

puts result
puts result['main']['temp_max']


# Or wrap things up in your own class
