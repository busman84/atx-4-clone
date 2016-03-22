#Intro to Rails

#####MVC 
MVC is a pattern defining a web app in three parts:

* The (M)odels, holding all the business logic
* The (V)iews, rendering the database content as a readable format
* The (C)ontrollers, linking views and models

```

                                          -----> Model <----> DB
                                         |         |
            response        request      |         |
   Browser <-------- router -------> controller <--
                             GET         ^
                             PUT         |
                             POST         -----> view <----> html/images/css/js
                             DELETE

```


#### A Look Back at Rails History
As we look back at the history of Rails, let's review some of the more significant releases over the years.

* Rails 1.0 (Dec 2005) - Mostly polishing up and closing pending tickets from the first release along with the inclusion of Scriptaculous 1.5 and Prototype 1.4.
* Rails 1.2 (Jan 2007) - REST and generation HTTP appreciation
* Rails 2.0 (Dec 2007) - Better routing resources, multi-view, HTTP basic authentication, cookie store sessions
* Rails 2.0 (Nov 2008) - i18n, thread safe, connection pool, Ruby 1.9, JRuby
* Rails 2.3 (Mar 2009) - Templates, Engines, Rack
* Rails 3.0 (Aug 2010) - New query engine, new router for controller, mailer controller, CRSF protection
* Rails 3.1 (Aug 2011) - jQuery, SASS, CoffeeScript, Sprockets with Assets Pipeline
* Rails 3.2 (Jan 2012) - Journey routing engine, faster development mode, automatic query explains, tagged loggin for multi-user application


Install Rails

```bash
  gem install rails -v=INSERT_RAILS_VERSION_HERE
```

Rails includes some new command-line tools, so if you're using `rbenv` you'll need to rehash, which will get your Ruby environment back into order for you.

```bash
  rbenv rehash
```

## Codealong Cookbook
For this introduction, we want to create a simple app: a cookbook! The specs for this app are as follows:

* Display a list of all recipes
* Create new recipes and edit existing recipes
* Delete recipes

#####Initialize a Rails App

```bash
  rails new cookbook -d postgresql
```
Now, let's go into the cookbook folder:

```bash
  cd cookbook
```
Let's look at the contents of this folder (using `ls`), and take a look at the files and folders that were magically created by the `rails new` command:

```
├── app
├── bin
├── config
├── db
├── lib
├── log
├── public
├── test
├── tmp
└── vendor
```

#####Create the database

```bash
rake db:create
```

#####Create a Migration
Migrations are Ruby classes that are designed to make it simple to create and modify database tables. Rails uses `rake` commands to run migrations, and it's possible to undo a migration after it's been applied to your database. Migration filenames include a timestamp to ensure that they're processed in the order that they were created.

```bash
rails g migration create_recipes name:string description:text

rake db:create
```


#####Create a Model
We can create a model using `rails g model MODEL_NAME [fields]`.

```
rails g model recipe name:string description:text
rails g model recipe --migration=false
```

This will generate the recipe model by itself along with a new migration containing all the fields and the data types if you wrote them when you typed the console. Since we already created a migration with the field for the recipe tables, we can use the flag `--migration=false` to prevent another migration from being created.

#####Create a Controller
We can use a generator called `controller`, using `rails g controller CONTROLLER_NAME [ACTIONS]`. For instance, if we want to create a controller for the resource `recipes` with an action and a view for `index` and `show`, we would type in the console `rails g controller recipes index show`. This command would create a bunch of files and modify some others:

   * The controller itself, `recipes_controller.rb` inside `app/controllers`
   * The views for each method , in this case
     * `app/views/index.html.erb`
     * `app/views/show.html.erb`
   * The routes handlers for these two actions will also be added to config/routes.rb :
     * `get '/recipes/index', to: 'recipes#index'`
     * `get '/recipes/show', to: 'recipes#show'`
     
     
##### Create methods for a RESTful controller

A RESTful resource will include 7 methods:

* Index
* Show
* New
* Create
* Edit
* Update
* Delete

Rails has a generator called `scaffold` that will create the whole MVC structure for a resource, let's say that inside the cookbook app, we want the `Recipe` resource to have a title and a content field, we would type:

```ruby
rails g scaffold recipe title content:text
```

Running this command will generate a lot of files, including the controller, the views, the model, and the migration. It will also update the routes file.

This line hides some powerful rails magic - it's actually mapping the seven restful methods from the controller `recipes` to the related http routes with the correct HTTP verbs and uris:


| REST Route type | HTTP Verb | URI | ruby method name|
|-----------------|-----------|-----|-----------------|
|index|    GET    |     /recipes(.:format)          |   recipes#index|
|create|    POST   |     /recipes(.:format)          |   recipes#create|
|new|    GET    |     /recipes/new(.:format)      |   recipes#new |
|edit|    GET    |     /recipes/:id/edit(.:format) |   recipes#edit|
|show|    GET    |     /recipes/:id(.:format)      |   recipes#show|
|update|    PUT    |     /recipes/:id(.:format)      |   recipes#update|
|destroy|    DELETE |     /recipes/:id(.:format)      |   recipes#destroy|

These seven routes have been created just by adding `resources :recipes` in the file `routes.rb` 


#####Routing
Rails has a "routing engine" that separates the routing logic from the controller logic (what we want to happen when routes are requested). The configuration for this routing engine is in the file `config/routes.rb`.

```ruby
Rails.application.routes.draw do
 # get '/', to: '/recipes#index'
 # root to: '/recipes#index'
end
```

##### Views
There is no specific generator that will create only a view file, but you can add them manually into the appropriate folder inside views.

For instance, if we want to add a view file `about` for the resource `Recipe`, we can create a file `about.html.erb` in `app/views/recipes`.

If a view is "static" - as in, it doesn't use any instance variables created in the controller - you can just create a route for this view and rails will render it in the browser even if there is no method in the controller:

In config/routes.rb do:

```ruby
get "/about", to: 'recipes#about'
```

If there is a file `about.html.erb` in `app/views/recipes`, this file will be automatically rendered when you call `localhost:3000/recipes/about`


### Run server and visit Localhost:3000

To run the server use the command `rails server` or `rails s`

What happens when you visit http://localhost:3000 in the browser? Check out the diagram in the browser.

1. The browser makes a request for the URL http://localhost:3000.
2. The request hits the Rails router in config/routes.rb. The router recognizes the URL and sends the request to the controller.
3. The controller receives the request and processes it.
4. The controller passes the request to the view.
5. The view renders the page as HTML.
6. The controller sends the HTML back to the browser for you to see.

This is called the request/response cycle. It's a useful way to see how a Rails app's files and folders fit together.

![](https://s3.amazonaws.com/codecademy-content/projects/3/request-response-cycle-static.svg)

