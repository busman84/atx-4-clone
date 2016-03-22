require_relative 'sxsw'

class Interactive < SXSW
  attr_accessor :hackathons
  attr_accessor :badge_type
  attr_accessor :speakers

  def initialize(badge_type)
    @badge_type = badge_type
  end

  def print_hackathons
    i = 1
    @hackathons.each do |hackathon|
      puts "#{i}. #{hackathon[:name]} - #{hackathon[:time]}"

      i += 1
    end
  end

end