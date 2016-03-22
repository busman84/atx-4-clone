require_relative 'db_connection'

puts "What is the id of the city you're looking for?"

city_id = gets.chomp

city = City.find city_id

puts "#{city.name} has #{city.population} people"

# SELECT * FROM cities;
# cities = City.all

# cities.each do |city|
#   puts "#{city.name} has #{city.population} people"
#   #puts city.inspect
# end