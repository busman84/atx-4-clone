puts "What is your name?"

name = gets.strip.capitalize

puts "Good morning, #{name}! You wake up in the morning at 7 AM. Lots of time to get to WDI4! Little do you know, today is unlike any other day..."

puts "Do you DRIVE or take the BUS?"

transportation = gets.strip.downcase

if transportation == "bus"
  puts "Do you get on the NORTH bus or SOUTH bus?"

  direction = gets.strip.downcase

  if direction == "north"
    puts "The bus is late!"
  elsif direction == "south"
    puts "Wrong way!"
  else
    puts "Not an option!"
  end
elsif transportation == "drive"
  puts "You get stuck behind Mike riding his llama to school. Why can't he go any faster than that?! Train your llama to run, Mike!!!!"
else
  puts "That's not an option!"
end
