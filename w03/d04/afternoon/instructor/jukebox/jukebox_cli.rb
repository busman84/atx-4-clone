require_relative 'jukebox.rb'

puts "Grooooooovy! Welcome to the coolest jukebox CLI ever!"

puts "Which artist do you want to listen to?"
artist_name = gets.strip

puts "You picked #{artist_name}! Here are #{artist_name}'s songs!"
jukebox = Jukebox.new(artist_name)
jukebox.print_songs

puts "Which song do you want to play?"
index = gets.strip.to_i
jukebox.play_song(index)
