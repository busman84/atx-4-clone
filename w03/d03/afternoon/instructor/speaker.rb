class Speaker
  attr_accessor :first_name
  attr_accessor :last_name
  attr_accessor :focus

  def initialize(first_name="Pied", last_name="Piper", focus="Lossless compression")
    @first_name = first_name
    @last_name = last_name
    @focus = focus
  end

  def introduce_yoself 
    puts "Hi, my name is #{@first_name} #{@last_name} and my focus is #{@focus}"
  end

end