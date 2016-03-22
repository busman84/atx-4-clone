## Classes & Objects

### Learning Objectives

* Explain the difference between a class and an instance
* Instantiate and use an object
* Explain what getter and setter methods are, and why we need them
* Explain `attr_accessor`, `attr_reader`, `attr_writer` and why they're useful
* Describe the difference between local, global, instance, and class variables
* Explain class versus instance methods
* Demonstrate modifying the initialize method
* Explain inheritance and why it's useful
* Discuss default inheritance from Object (`inspect`, `to_s`)

### Review

* JS objects
  - Why did we need them? 
  - Properties 
  - Methods
* Ruby methods 
  - Parameters
  - Default parameters

### Intro 

Everything in Ruby is an object. This means that everything has properties and methods contained inside it. 

```ruby
puts "Howdy, pardner".length
=> 14

puts "manny fresh".upcase
=> MANNY FRESH
```

```ruby
puts 45635266243.class
=> Fixnum

puts 45635266243.to_s.class
=> String
```

### Classes 

Think of classes as blueprints for the objects that will be created in your application. A class will contain properties and methods that are relevant to that particular type of object. Objects are able to maintain state and respond to messages through method calls. 

```ruby
# Class names should use Pascal case
class BananaStand
end
```

There's no real information in there yet, but now that we've defined it, it exists. How do we make a new Banana Stand then?

```ruby
my_banana_stand = BananaStand.new
```

This is what's referred to as initializing a new instance. When thinking in objects, we consider this class kind of like a blueprint for all other banana stands (or objects) we make, and an instance is a clone of that class. 

> As another example, consider the chair you're in now a single instance of a chair - it was created using the known traits of a chair. You would consider the concept of a chair, in general, the class. All chairs are created using the known traits of the Chair Class, or the concept of a chair.

#### Getters & Setters

Using code, let's see if we can find a way to describe what banana stands are all about. How would we do this if it were a hash? Maybe something like:

```ruby
my_hashed_banana_stand = {
  color: "yellow",
  opened_in: 1953,
  manager: "George Michael",
  money_in_the_banana_stand: true
}
```

Those are all excellent properties, let's see how we'd make those into **attributes** (the instance variables) of our object.

```ruby
class BananaStand
  def color
    "yellow"
  end
  def opened_in
    1953
  end
  def manager
    "George Michael"
  end
  def money_in_the_banana_stand
    true
  end
end

my_banana_stand = BananaStand.new
my_banana_stand.color # => yellow
my_banana_stand.manager # => George Michael
my_banana_stand.money_in_the_banana_stand #=> true
```

We call those **getters** or **getter methods** because they're getting information from inside our object, but the problem here is that our info is hardcoded.

Imagine we're making multiple instances of the model - we want a lot of banana stands - we might need to change who the manager is for each instance of the banana stand.

This is where we start mixing in what we know about variables. Specifically, **instance variables**.

```ruby
class BananaStand
  def color
    "yellow"
  end
  def opened_in
    1953
  end
  def money_in_the_banana_stand
    true
  end

  # getter for "manager"
  def manager
    # this could, for the record, be named whatever you like, but it's best to keep it obvious & simple
    @manager 
  end

  # setter for "manager"
  def manager=(manager_name)
    @manager = manager_name
  end

end
```

That's interesting – it's sort of just a normal method with one argument, it just happens to have an `=` in the name. `manager=` instead of just `manager`

Let's see it in action.

```ruby
my_banana_stand = BananaStand.new
my_banana.manager # => nil, we haven't set it
my_banana.manager = "Tobias" # hey, look manager=, just with a space
my_banana.manager # => "Tobias"
```

That's fantastic. Now if we made another, separate instance, we could have two different banana stands, both **instances** of our blueprint **class**.

## Exercise 

**Pair Exercise: 15 min**

Pick one of the following options below and create a class for it. Pick at least two attributes and then write getters and setters for those attributes. 

* Create a class that represents something in this room right now
* Create a class that one of your favorite existing web applications might have in their codebase
* Create a class that represents a WDI student

Instantiate your object and try getting/setting the attributes you defined.  

<hr>

#### Faster getters & setters

Now that you're experts on getters & setters, you should know that you don't always have to code them by hand. Ruby comes with a shortcut to make using them faster:

```ruby
class BananaStand
  attr_accessor :color, :opened_in, :manager, :money_in_the_banana_stand
  # There's also just attr_reader for getters & attr_writer for setters
end
```

You may use the different accessors to communicate your intent to someone reading your code, and make it easier to write classes which will work correctly by other developers. 

**attr_reader** - The attribute is only allowed to be read

```ruby
attr_reader :color

# is the same as: 

def color
  @color
end
```

**attr_writer** - The attribute is only allowed to be written 

```ruby
attr_writer :color

# is the same as: 

def color=(value)
  @color = value
end
```

**attr_accessor** - The attribute is allowed to be both read and written by code using that class 

```ruby
attr_accessor :color

# is the same as: 

def color
  @color
end

def color=(value)
  @color = value
end
```

#### Variable Scope

##### Local 

Local variables are local to the code construct in which they were created. For example, variables declared in a method or loop cannot be accessed outside of it. 

```ruby
local_variable = "This is local"
```

##### Global 

Global variables are prefixed with the `$` and are accessible from anywhere in the application. 

> Use of global variables is strongly discouraged. The problem with global variables is that not only are they visible anywhere in the application, they can also be changed from anywhere in the application. This can make tracking bugs extremely difficult.

```ruby
$global_variable = "This can be accessed anywhere in the application"
```

##### Class 

A class variable is a variable that is shared among all instances of a class. This means that if one object instance changes the value of the variable, that new value will essentially change for all other object instances.

Class variables are declared by prefixing the variable name with two @ characters (`@@`).

```ruby
@@total_count = 0
```

##### Instance 

Instance variables are similar to class variables except that their values are local to a specific instance of an object. For example, if a class contains an instance variable called `@count`, if one instance of the object changes the current value of `@count` the change is local to only the object that made the change.

```ruby
@count = 0
```

### Methods

In a nutshell, class methods can only be called on classes and instance methods can only be called on an instance of a class.

```ruby
class GenericObject
  def self.foo
    puts 'This is a class method'
  end
  
  def bar
    puts 'This is an instance method'
  end
end

GenericObject.foo # => This is a class method
GenericObject.bar # => NoMethodError: undefined method ‘bar’ for GenericObject:Class

generic_object = GenericObject.new
generic_object.bar # => This is an instance method
generic_object.foo # => NoMethodError: undefined method ‘foo’ for #<GenericObject:0x1e820>
```

#### Class methods

You always call class methods on the class itself, not from instances of a class. Here are a couple of popular ways to define a class method.

```ruby
# Way 1
class Foo
  def self.bar
    puts 'a class method'
  end
end

Foo.bar # => a class method

# Way 2
class Foo
  class << self
    def bar
      puts 'a class method'
    end
  end
end
```

#### Instance methods 

Instance methods only work with an instance, you **have to** create a new instance to use them. 

```ruby
class Foo
  def bar
    puts 'an instance method'
  end
end

Foo.new.bar # => an instance method
```

### Object Initialization 

Whenever Ruby creates a new object, it looks for a method named `initialize` and executes it. One thing we can do with this is use the initialize method to put default values into our instance variables. 

The special `initialize` method is optional, you don't have to include one if you don't need anything to happen during object instantiation.

```ruby
# When the object is instantiated, we should see the message
class GetFunky
  def initialize
    puts "I'm getting funky"
  end
end

funky = GetFunky.new
```

```ruby
# Allowing instances to pass values to the object being created
class Person
  def initialize(fname, lname)
    @first_name = fname
    @last_name = lname
  end
end

miked = Person.new "Mike", "Dang"
```

```ruby
# Setting some default values to use if none are provided 
class Person
  def initialize(fname="John", lname="Doe")
    @first_name = fname
    @last_name = lname
  end
end

miked = Person.new "Mike"
```

### Inheritance 

You won't have to code very long before you realize there are types of objects that are related and can share a lot of the same attributes and methods. In order to keep our code DRY, we'll want to take advantage of inheritance and have specific objects inherit from more generic super classes. 

Ruby has single inheritance, meaning each class has one and only one parent class. When a message is sent to a class, it looks in the immediate class and goes up the inheritance chain until a method matching that name is found. If none is found, an error will be returned. 

```ruby
# Our superclass
class Animal 
  def leg_count
    4
  end
  def is_mammal
    true
  end
  def speak
    nil
  end
  # Here we call a method within the same class and modify the result from it
  def speak_loudly
     speak.upcase 
  end
end

# The Dog subclass inherits from the Animal superclass
class Dog < Animal 
  def speak
    "Bark bark bark!"
  end
end

# The Duck subclass inherits from the Animal superclass
class Duck < Animal
  def leg_count
    2
  end
  def is_mammal
    false
  end
  def speak
    "Quack!"
  end
end
```

##### Default Inheritance

**inspect** - The `inspect` message can be sent to any object and prints the object's id and instance variables

```ruby
duck = Duck.new
puts duck.inspect 
# => <Context::Duck:0x00000000a770b0>
```

**to_s** - Output information about an object, can be overridden 

```ruby
class Duck < Animal
  def leg_count
    2
  end
  def is_mammal
    false
  end
  def speak
    "Quack!"
  end
  def to_s
    "This is a pretty sweet duck object"
  end
end

duck = Duck.new
puts duck # => This is a pretty sweet duck object
```

## Exercise: Superheros

**30 min**

##### The Person superclass

- Create a `Person` class
- A `Person` has a name and an age
- Create a `to_s` method that prints out the person's name and age.

##### The Superhero subclass

- Create a `Superhero` class that inherits from `Person`
- Override the initialize method to accept a name, age *and* superpower
- Override the `to_s` method to include the person's superpower

<hr>
