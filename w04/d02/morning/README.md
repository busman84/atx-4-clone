## Active Record

### Learning Objectives

* Explain what an ORM is and why we use it (vs. writing SQL)
* Predict the SQL commands that will be issued during particular AR method calls
* Use Active Record to connect to a database from a Ruby program
* Create a Ruby class that inherits from the `ActiveRecord` class
* Use Active Record to create, read, update and delete data in a database
* Explain what SQL injection is and how it can be prevented
* Explain the popular types of Active Record queries like find, where, etc
* Use seeds to populate a database

### Preparation

1. Download the [World Sample Database](http://pgfoundry.org/frs/?group_id=1000150&release_id=366#world-world-1.0-title-content)
2. Open up terminal and run *$* `psql`
3. Create the database with the command *world_development=#* `CREATE DATABASE world_development;`
4. In a new terminal window, `cd` to where you downloaded **world.sql** and run *$* `psql -d world_development -f world.sql`

### ORM's

Object Relational Mapping is a technique that allows us to connect application objects to tables in a relational database.

For example, you can have a `dog` table that directly maps to a `dog` object in your application. 

Using ORMs, the properties and relationships of the objects in an application can be easily stored and retrieved from a database without writing SQL statements directly and with less database access code, overall.

### Active Record

[ActiveRecord](http://guides.rubyonrails.org/active_record_basics.html) is a Ruby library for working with relational databases like MySQL or Postgres. 

- A single Ruby object maps to a database table
- It's the "M" in MVC
- Represents relationships between objects in your model
- Validate models before they get saved to the database
- Follows **convention over configuration**, much like Rails
- It's an implementation of the "Active Record" design pattern

#### Refresher on Models

When we design classes - or models of objects - we say we are 'modeling' them. So, our models allow us to deal with objects in our code.

Active Record is the M in MVC - the model - which is the layer of the system responsible for representing business data and logic.

### Naming Conventions

By default, Active Record uses naming conventions to map models to the database tables. Class names are pluralized to find the respective database tables. It pluralizes both regular and irregular words. 

Model/Class | Table/Schema
----------- | -------------
Article | articles
LineItem | line_items
Deer | deers
Mouse | mice
Person | people

#### Optional column names 

* `created_at` (datetime) - Automatically set to the current date/time when the record is first created.
* `updated_at` (datetime) - Automatically set to the current date/time whenever the record is updated.

#### We do 

Rename the existing columns we have in the `world` database to work with Active Record

- `ALTER TABLE city RENAME TO cities;`
- `ALTER TABLE country RENAME TO countries;`
- `ALTER TABLE countrylanguage RENAME TO country_languages;`

### Get the Active Record gem

Active Record is a gem! But since we're building an app with a bunch of gems, we'll use Bundler. We'll only specify gems that we need, but for now, let's `bundle init` in the app's root directory and add:

```ruby
# Gemfile
# Tells our app where to get gems from
source "https://rubygems.org"  

# Gives us class methods like .find, .where and allows for object relational mapping
gem "activerecord"
# Postgres adapter
gem "pg"
```

And don't forget, what do we do every time we modify the Gemfile? 

`$ bundle install`

It's very easy to create Active Record models. All you have to do is to subclass the ActiveRecord::Base class and you're good to go:

```ruby
class City < ActiveRecord::Base
end
```

### Creating a connection to ActiveRecord

> The rest of this lesson builds upon the World sample database for Postgres

```ruby
# app.rb
require 'active_record'

# Establish a connection to our local `world` database
ActiveRecord::Base.establish_connection(
  adapter:  'postgresql',
  host:     'localhost',
  username: 'mikedang',
  password: '',
  database: 'world_development'
)
```

## Create Models

To connect an application object in Ruby to a table in your database with Active Record, all you have to do is create a new class that inherits from `ActiveRecord::Base`

```ruby
# models/city.rb
# This class is now directly tied to the `cities` table inside our world database
class City < ActiveRecord::Base

end
```

```ruby
# models/country.rb
# This class is now directly tied to the `countries` table inside our world database
class Country < ActiveRecord::Base

end
```

```ruby
# models/country_language.rb
# This class is now directly tied to the `country_languages` table inside our world database
class CountryLanguage < ActiveRecord::Base
  
end
```

```ruby
# app.rb
# ...
require_relative 'models/city'
require_relative 'models/country'
require_relative 'models/country_language'
# ...
```

## CRUD

#### Create

```ruby
# The create method automatically saves the data to the database
City.create(id: 5000, name: 'Funky Town', countrycode: 'USA', district: '9', population: 10)
```

``` ruby
# We can also create an object without saving it, then save when we're ready
city = City.new
city.id = 5000
city.name = 'Funky Town'
city.countrycode = 'USA'
city.district = '9'
city.population = 10
city.save
```

Did you see that? Active Record just took our Ruby method (.create) and converted it to SQL for us! It saved the data to a new row in our table with all those attributes. We just had to pass a hash to it. 

#### Read

```ruby
# Return all records for this table
cities = City.all
```

```ruby
# Search for one record by primary identifier
city = City.find(124)
```

```ruby
# First and last records that match
first_city = City.first
last_city = City.last
```

#### The Real Querying - Where

Now, before we can move on to the **UD** in CRUD, there's a big READ we need to learn about: querying. Querying, by definition, is just a way to ask questions of our database.

Like, "Find me a city with a population of 10 people":

```ruby
# Return array of cities with a population of 10
City.where(population: 10)
```

Or, "Find me a city with a population of 10 people **and** with a country code of 'USA'":

```ruby
# Return array of cities with a population of 10 and countrycode of 'USA'
City.where(population: 10, countrycode: 'USA')
```

Both of those get you back an array, because a `where` query is asking for _any_ records it finds. You could combine this with `.first`, `.last`, a `.each` loop, or whatever you need.

#### The Real Querying - Find

While _where_ returns you an array, _find_ returns you one item – or a 'not found' error.

```ruby
# Find a city by id of 7940
City.find(7940)
# ActiveRecord::RecordNotFound: Couldn't find City with 'id'=7940
```

Ruby's errors are actually super helpful if you read them. But let's see some that work. Obviously we just learned:

```ruby
# Find a city by id of 2. Returns one object
City.find(2)
```

But how about something more interesting:

```ruby
# Return the first record found of a city with a population of 10
City.find_by(population: 10)
```

Now, this is interesting – it does return one, and not an array. It returns the first that it finds. If we try this, we'll see there's _more_ than one:

```ruby
City.where(population: 10).count # => 3
```

So be mindful of when you're using `where` and when you're using `find`. Both are super useful, you just have to know the difference.

#### Update

Now, the wonderful act of updating a record we know exists. Let's start by grabbing one and throwing it in a variable.

```ruby
city = City.last
```

Updating is easy, and we can do it in two ways, similar to our new/create earlier. The verbose way:

```ruby
city.name = "The Real Funky Town"
city.population = 11
city.save
```

Or, we could wrap it up in a convenient single command, passing in a hash of what we want to change:

```ruby
city.update_attributes(name: "The Real Funky Town", population: 11)
```

Both will do the trick, and there's no significant difference between them.

#### Delete

Finally, the most devastating operation, destroying. Hopefully this one's not too surprising, because there's not much else you can do besides get rid of something:

```ruby
city.destroy
```

That'll get rid of it from our database, forever.

Now, you might be tempted to call this 'delete' instead of 'destroy' – in Active Record, that distinction matters. We aren't going to get too deep into it, you're welcome to research it on your own, but the difference is this:

- **Destroy**, the one you will want 99.99% of the time, gets rid of a record, and calls callbacks
- **Delete**, which you'll probably not need to use, gets rid of a record, and _doesn't_ call callbacks

Similar to the concept of JavaScript's callbacks, Active Record lets us run methods if we want to when certain events happen. That's a little too deep for right now, but with a little research, you can find out plenty about it.

If you're having trouble grasping the difference, just remember: use '.destroy'.

## SQL Injection

To prevent SQL injection attacks by hackers, you should never directly take any input from users and supply them as parameters without escaping them first. 

```ruby
# INSECURE
User.where("user_name = '#{user_name}' AND password = '#{password}'").first

# SECURE (Escaping)
User.where("user_name = ? AND password = ?", user_name, password).first

# SECURE (Hash)
User.where(user_name: user_name, password: password).first

# SECURE (Bind params w/ hash)
User.where(
  "user_name = :user_name AND password = :password",
  { user_name: "joe", password: "SuperSecretPassword" }
).first

```
