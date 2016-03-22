require 'httparty'
require 'pry'

def find_id(artist_name)
  response = HTTParty.get("https://api.spotify.com/v1/search?q=#{URI.encode(artist_name)}&type=artist")
  artists_array = response["artists"]["items"]
  # response["artists"]["items"][0]["id"]
  # response["artists"]["items"].first["id"]
  artist_hash = artists_array.first
  artist_hash["id"]
end

def find_image(artist_name)
  response = HTTParty.get("https://api.spotify.com/v1/search?q=#{URI.encode(artist_name)}&type=artist")
  artists_array = response["artists"]["items"]
  artist_hash = artists_array.first
  image_hash = artist_hash["images"].first
  image_hash["url"]
end

puts find_image("Billy Joel")
