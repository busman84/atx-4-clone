require 'httparty'
require 'pry'

puts "Welcome to the Random Cat CLI!"

puts "Generating a random cat..."

# Open random cat GIF
url = "http://api.giphy.com/v1/gifs/search?q=funny+cat&api_key=dc6zaTOxFJmzC"
response = HTTParty.get(url)
cats_array = response["data"]
random_cat_hash = cats_array.sample
cat_url = random_cat_hash["url"]
system("open #{cat_url}")

puts "Goodbye!"
