require_relative 'interactive'
require_relative 'film'
require_relative 'music'
require_relative 'speaker'

interactive = Interactive.new "Interactive Badge"

# Hackathon 1
hackathon_1 = {
  name: 'Longhorn Hackathon',
  time: 'March 3, 2016'
}

# Hackathon 2
hackathon_2 = {
  :name => 'GA Hackathon',
  :time => 'March 24, 2019'
}

speaker_1 = Speaker.new("John", "Doe", "Singing")
speaker_2 = Speaker.new("Jane")
speaker_3 = Speaker.new

interactive.speakers = [speaker_1, speaker_2, speaker_3]

interactive.speakers.each do |speaker|
  speaker.introduce_yoself
end



# interactive.hackathons = [hackathon_1, hackathon_2]

# interactive.print_hackathons

# puts "The badge I have is the #{interactive.badge_type}"






