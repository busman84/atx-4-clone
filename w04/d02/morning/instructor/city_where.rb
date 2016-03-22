require_relative 'db_connection'

puts "What's the name of the city?"

city_name = gets.chomp.downcase.capitalize

cities = City.where(name: city_name)

cities.each do |city|
  puts "#{city.name} in the country of #{city.countrycode} with #{city.population} people"
end