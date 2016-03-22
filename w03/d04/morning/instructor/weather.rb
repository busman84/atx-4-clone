require 'httparty'
require 'json'

# Use the class methods to get down to business quickly
# response = HTTParty.get('http://api.openweathermap.org/data/2.5/weather?id=4254010&units=imperial&APPID=33814a2cc7924300317c3f625816be07')

# #puts response.body, response.code, response.message, response.headers.inspect
# buffer = response.body
# result = JSON.parse(buffer)

# puts result
puts result['main']['temp_max']


# Or wrap things up in your own class

class OpenWeatherMap
  include HTTParty
  base_uri 'api.openweathermap.org'

  def initialize()
  end

  def get_by_city(city_name, country_code)
    options = { query: { q: city_name + ',' + country_code, units: 'imperial', APPID: '33814a2cc7924300317c3f625816be07' } }
    self.class.get('/data/2.5/weather', options)
  end

  def get_by_zip(zip_code, country_code)
    options = { query: { zip: zip_code + ',' + country_code, units: 'imperial', APPID: '33814a2cc7924300317c3f625816be07' } }
    self.class.get('/data/2.5/weather', options)
  end
end

weather = OpenWeatherMap.new
puts weather.get_by_zip '78701', 'us'
puts weather.get_by_city 'Dallas', 'us'
