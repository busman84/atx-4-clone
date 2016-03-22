class Dog

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def bark_name
    "Woof! My name is #{@name}!"
  end

end
