require_relative 'db_connection'

puts "What is the new id of the city?"
city_id = gets.chomp

puts "Name?"
city_name = gets.chomp.downcase.capitalize

puts "District?"
district = gets.chomp

puts "Country Code?"
country_code = gets.chomp

puts "How many people?"
population = gets.chomp

City.create(id: city_id, name: city_name, countrycode: country_code, district: district, population: population)

puts "Excellent work, you have a new city"