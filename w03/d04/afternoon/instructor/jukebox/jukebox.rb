require 'httparty'
require 'pry'
require_relative 'song.rb'

class Jukebox

  def initialize(artist_name)
    @artist_name = artist_name
    @spotify_id = get_id
    @songs = find_songs
  end

  def print_songs
    @songs.each_with_index{ |song, index| puts "#{index + 1}. #{song.name} – #{song.album}" }
  end

  def play_song(index)
    url = @songs[index - 1].url
    system("open #{url}")
  end

  def find_songs
    response = HTTParty.get("https://api.spotify.com/v1/artists/#{@spotify_id}/top-tracks?country=US")
    songs_array = response["tracks"]

    songs_array.map{ |song_hash| build_song(song_hash) }
  end

  def build_song(song_hash)
    Song.new(song_hash["name"], @artist_name, song_hash["album"]["name"], song_hash["external_urls"]["spotify"])
  end

  def get_id
    response = HTTParty.get("https://api.spotify.com/v1/search?q=#{URI.encode(@artist_name)}&type=artist")
    artists_array = response["artists"]["items"]
    artist_hash = artists_array.first
    artist_hash["id"]
  end

end
