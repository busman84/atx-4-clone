# Arrays, Hashes, & Methods

### Objectives

- Create and manipulate data in an array in Ruby
- Use basic array methods including count, first, and last
- Compare and contrast "break" and "next", and when you would use each
- Contrast loops with enumerators and when you would use each of them
- Explain what 'yielding' to a block means, and why it is necessary
- Iterate through arrays with map and each
- Explain differences between select, map, and delete
- Explain what a hash is, what purpose it serves and how it compares to a JS object
- Explain what a symbol is and why they are commonly used as keys in hashes
- Get and set values for specific hash key
- Define what a method is in Ruby and how it compares to a JavaScript function
- Write a method that accepts multiple arguments
- Set default arguments of a method
- Define 'implicit return' and how it contrasts to JavaScript's 'explicit return'
- Write a method that returns a value

### Preparation

- Recall the differences between use-cases and definitions for arrays & hashes 
- Name the equivalent of a hash in JavaScript

### Review

- Why do we need to learn a backend language like Ruby? 
- In Ruby, everything is an object. Every bit of information and code can be given their own properties and actions
- Ruby data types
    - Boolean
    - String
    - Integer
    - Float
    - Symbols
    - nil
- Concatenating strings
    - Addition operator: `"Hello " + name`
    - String interpolation: `"Hello #{name}!"`
- Truthy/Falsy
    - In Ruby, only `false` and `nil` are falsy, everything else is "truthy"

## Intro

Because you'll be using arrays & hashes so, so much in your time as a developer, we want to get you up to speed with how to work with them.

For these Ruby data collections, you'll be reminded of similar ideas in JavaScript. That's fantastic. Anytime you can draw on that connection to help yourself guess at what methods might exist, or even just what to Google, you'll be in good shape.

## Working with Arrays

Just as a refresher – what are arrays for? What do they do? **They're for holding a collection of values**, that's it.

#### Making Arrays, Adding to Arrays

So, let's start simple – we make arrays in Ruby the same as we did in JavaScript. Nothing unexpected here.

```ruby
numbers = [1,2,3,4] # I'm obviously an array
```

Then, once you've created an array, how do you imagine you add to an array?

```ruby
numbers.push 5 # dun, dah nun dun dun dun, push it
# => [1,2,3,4,5]
```

Similarly, we've got another old favorite – the shovel.

```ruby
numbers << "six" # there no shovel puns to see here
# => [1,2,3,4,5,"six"]
```

#### Removing From Arrays

Now, obviously it's possible to mix data types (Ruby does not care), but why would we want to? That'll be weird. Let's get rid of one.

```ruby
numbers.delete "six" # give it the value you want to get rid of
# => [1,2,3,4,5]
```

#### Useful Array Miscellany

There are so many great array methods - here are a few you'll probably use from time to time.

```ruby
# how many values are there?
numbers.length # => 5, of course

# just as you'd expect, get's the value at nth index
# remember, and indexes start at 0!
numbers[3] # => 4

# a handy method equivalent to numbers[0]
numbers.first
# also a handy method equivalent to numbers[numbers.length-1]
numbers.last

# and what if we need to rearrange? so useful!
numbers = [3,2,4,1,5]
numbers.sort # [1,2,3,4,5]
numbers.sort.reverse # => [5, 4, 3, 2, 1]
```

##### You'll be trying this soon, but first – iterating!

Now the good stuff – looping through our array and doing something with each value.

**How did we iterate over an array in JavaScript?** It was pretty convoluted:

```js
for (var i = 0; i < numbers.length; i++) {
  console.log(numbers[i]);
}
```

We can do for loops in Ruby, too, but we've got something _much_ nicer:

```ruby
numbers.each do |number|
  puts "i am number #{number}"
end

# i am number 1
# i am number 2
# i am number 3
# i am number 4
# i am number 5

```

Isn't that just so incredibly readable?

#### Loops

```ruby
# loop
i=0
loop do
  i+=1
  print "#{i} "
  break if i==10
end
```

```ruby
# while loop
i=1
while i < 11
  print "#{i} "
  i+=1
end

# while modifier
i=0
print "#{i+=1} " while i < 10
```

```ruby
# until loop
i=1
until i > 10
  print "#{i} "
  i+=1
end

# until modifier
i=0
print "#{i+=1} " until i == 10
```

```ruby
# for loop (used to iterate over a range)
for i in 1..10
  print "#{i} "
end

for x in 'a'..'z'
  print "#{x} "
end
```

##### Break vs Next 

``` break ``` allows us to exit a loop at any point 

``` next ``` allows us to skip over the current iteration and go on to the next one 

```ruby
i=0
loop do
  i+=1
  next if i==3
  print "#{i} "
  break if i==10
end
```

#### Enumerators/Iterators

Iterators are methods that take blocks and execute that block as many times as there are iterations.

```ruby
# each iterator
[1,2,3,4,5,6,7,8,9,10].each { |value| 
    print "#{value} "
}
```

```ruby
# times iterator
10.times { |i| 
    print "#{i} "
}
```

```ruby
# upto iterator
1.upto(10) { |i| 
    print "#{i} "
}
```

#### Loops vs Enumerators

The difference between the two is subtle. Loops have existed from the start, almost every programming language has loops of some sort. Enumerators/iterators are a newer concept and only exist in newer languages like Ruby.  

Loops are both powerful and dangerous, it's possible to create "infinite loops" that will cause a program to crash. With iterators though, this is impossible because it only loops through all the existing values and nothing more. 

The code is also more expressive and easier to write/understand. 

```ruby

# loop 
i = 0
while i < 5                      
  puts "hello"
  i += 1
end

# "times" iterator
5.times do 
    puts "hello"
end

```

```ruby
words = ["one", "two", "three", "four"]

# loop 
i = 0
while i < words.length                         
  puts words[i]
  i += 1
end

# "each" iterator
words.each do |w|
    puts w
end
```

#### Extra Detail: Dem Blocks Tho!

That `do`/`end` thing you're messing with is called a _block_, and it just runs the code in between, almost like a little function without a name - like anonymous functions in JavaScript or lambdas in Python.

You'll see blocks all the time, and you'll use `.each` like it's your job. It just loops through each value in your array and assigns a local variable (that you decide) to each object. You come up with what you want it called in the "pipes", aka those tall neighbors surrounding the variable: `|a_variable_of_my_choosing|`.

##### 'yielding' to a block

If the current method has been given a code-block (by the caller, when it was invoked), the yield executes the code block passing in the specified parameters.

``` [1,2,3,4,5].each { |x| puts x } ```

Now ``` { |x| puts x } ``` is the code-block (x is a parameter) passed to the each method of Array. The Array#each implementation would iterate over itself and call your block multiple times with x = each_element

To make it super clear: if `numbers` is a variable holding `[1,2,3,4,5]`, then `numbers.each` will go through each number and do _something_ to each variable. It's sort of as if the code is doing this:

```ruby
# numbers.each do |number|
#   puts "i am number #{number}"
# end

number = 1
puts "i am number #{number}"

number = 2
puts "i am number #{number}"

number = 3
puts "i am number #{number}"

number = 4
puts "i am number #{number}"

number = 5
puts "i am number #{number}"
```

Oh, and for best practice, always try to name`|a_variable_of_my_choosing|` the singular tense of the array you're iterating over: ```numbers.each do |number|``` or ```articles.each do |article|```

Of course, the beauty of loops is that we don't have to write all that out.

And a bonus tip: `do`/`end` is functionally the same as `{`/`}`, so you'll see both. The curly braces are for when you want to keep it on one line, but it does not matter.
```ruby
# totally the same
numbers.each do |number|
  puts "i am number #{number}"
end

# totally the same
numbers.each {|number| puts "i am number #{number}"}
```

#### Enumerable methods (each, select, map/collect)

``` each ``` returns the original object it was called on because you only need to access each value to perform an action and not looking for a return object

``` select ``` returns a new object (e.g. array) filled with only those original items where the block you gave it returned true

```ruby
my_array = [1,2,3,4,5,6,7,8,100]
my_array.select{ |item| item % 2 ==0 }
```

``` map/collect ``` returns a new array filled with whatever gets returned by the block each time it runs

```ruby
[1, 2, 3].map { |n| n * n } 
# => [1, 4, 9]
```

```ruby
# destructive
names = ['mike', 'sean']
names.map! {|name| name.capitalize } # now names contains ['Mike', 'Sean']
```

##### Other useful enumerable methods

```ruby
foo = [1, 2, 3, 4, 5]

# any? returns true/false and answers the question, "do ANY of the elements in this object pass the test in my block?"
foo.any? { |num| num > 1 }

# all? returns true/false and answers the question, "do ALL the elements of this object pass the test in my block?"
foo.all? { |num| num > 1 }

# none? returns true only if NONE of the elements in the object return true
foo.none? { |num| num > 1 }

# find returns the first item in your object for which the block returns true
foo.find { |num| num > 1 }
```

## Arrays - Independent Practice 

**15 min**

Alright, practice time.

- Given the following list of student names, **iterate over them**, **prepending** "A+ " if their name includes an "A" in it. Make a new array if you need to
- Then, **sort the students** so that A+ students come first
- Next, **select just the students with A+** in their names. Look it up in the Ruby docs if you need to.
- Finally, **count how many A+ students you have**

```ruby
students = ['Suzy', 'Daniel', 'James', 'Mary', 'Phillip', 'Siegfried']
```

## You're Ready to Move On to Hashes

We use hashes constantly. Hashes, like JavaScript objects, are a great way to store related data of all different kinds, in a way that's super readable.

The key to hashes is that they always house key/value pairs. **The key describes the properties, the value is the information relating to or describing the property.**

#### Creating a Hash

To see it in action, let's pick something random in the room and try to describe it.

> **Note:** just to prove hashes can hold all kinds of great data, let's see how many different data types we can describe our object with!

For example, let's describe a fan in the room.
```ruby
fan = {
  type: 'stand',
  blades: 3,
  speeds: ['low', 'medium', 'high'],
  rotating: false,
  height: {
    measurement: 3.5,
    unit: 'ft'
  }
}
```

Nice! Good work.

Now, based on what you know about how JavaScript objects work, how would you guess we grab data out of here? Let's say we want to know how many blades it has.

```ruby
fan[:blades] # => 3
```

#### Symbols Are For Memory

Well, young padawans, that's because our keys up above are symbols, not strings.

Symbols are basically just like strings, except they save computer memory.  Every string you create is unique and takes up space on your computer, even if they're the same value! When we're busy looking up key/value pairs, we don't want to be wasting memory - we want it to be fast!

Let's watch:

```ruby
"Your Name".object_id
#=> a number

"Your Name".object_id
#=> a different number

:your_name.object_id
#=> a number

:your_name.object_id
#=> the same number!
```

Symbols on their own don't do much, but they work great as keys. There are two ways to write them:
```ruby
{
  # from older ruby versions, still totally work
  :the_old_way => 'some value',

  # from newer ruby versions, which is just shorter
  the_new_way: 'some value'
}
```

Either are fine; you'll see both a lot. Use the "new way" one if you can help it, just cuz it's nice.

For the record, strings as keys _are_ possible – we just try not to use them.

#### Adding to our hash

Real quick – what if we forgot a key/value pair, or want to add one in after the fact?

```ruby
fan[:color] = 'silver'

# {
#   type: 'freestanding',
#   blades: 5,
#   speeds: ['low', 'medium', 'high'],
#   rotating: false,
#   height: {
#     measurement: 100.4,
#     unit: 'cm'
#   },
#   color: 'silver'
# }
```

#### Guess how to get rid of a key/value pair?

Given we just learned to do this with arrays, it's okay to be unsurprised.

```ruby
fan.delete :color
# remember, parentheses are optional!
```

## Practice with Hashes

**15 min**

Now you try it!

- Partner up! Together on a blank document, describe your computer as a hash. Use any data types you can think of, because hash values can be anything!
- When you're done, each of you, open your computer and type it out in a new Ruby file. Try getting each key out, adding in new ones, and deleting ones just for fun.
- In your hashes, try to:
  - Include one key with the value as an array 
  - Include one key with the value as another hash (look to the example from earlier!)
- Remember, use the **new way** of creating hashes, if you remember how!

## Methods

* Similar to functions in other languages
* Used to bundle one or more repeatable statements into a single unit 
* Should begin with a lowercase letter
* Should be defined before calling them, not like JS and hoisting

```ruby
# Basic method 
def foo
    puts "hello"
end
```

```ruby
# Method with a parameter
def foo(str)
    puts "#{str}"
end 
```

```ruby
# Method with default values
def foo(str="hello",str2="there")
    puts "#{str} #{str2}"
end
```

#### Calling methods

```ruby
foo "Hi", "there"

foo("Hi", "there")
```

#### Return values from methods

* Every method in Ruby returns a value
* Using the ``` return ``` keyword is an explicit return
* If there is no ``` return ``` keyword, methods return the value of the last evaluated expression (implicit return)

```ruby
def test
   i = 100
   j = 10
   k = 0
end

# will return "k" if called, which is equal to 0
```
