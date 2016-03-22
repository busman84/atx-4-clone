# Gener-ello Assembly

## THE GOAL
- Build a Trello clone using Rails!

- **User stories:**
  - The user can create a new List.
  - The user can view an index of Lists.
  - The user can view a List and its corresponding Todos.
  - The user can add new Todos to a List.

## GROUPS

* Kelly, Zolon (Amanda)
* Munish, Christy (Amanda)
* Todd, Bonnie (Amanda)
* Jason, James (Mike)
* Antonia, Lauren, Noble (Mike)
* Ryan, Alison (Britney Jo)
* Allie, Jeremy (Britney Jo)

## STEPS

### STEP 1 – MODELING

Spend half an hour to an hour modeling – you'll need two resources `List` and `Todo` (or `TodoItem`). What attributes should the models have? Which model should include the foreign key? What are the associations between the two models?

**Slack your modeling structure to your assigned instructor before moving on!**

### STEP 2 – GENERATING & SETUP

Create your `new` Rails app using `rails new APP_NAME -d postgresql`! Run `rake db:create`.

Use `rails generate resource ...` to generate your `List` and `Todo` resources. Do not use scaffolding; that's not the point of this exercise.

Set up the associations between the two models.

### STEP 3 – LIST INDEX

Write your `index` controller action and create your `index.html.erb` view for `Lists`.

### STEP 4 – LIST SHOW

Write your `show` controller action and create your `show.html.erb` view for `Lists`.

### STEP 5 – LIST NEW/CREATE

Write your `new` controller action and create your `new.html.erb` view for `Lists`.

[Use `form_for` to set up the new form for your `Lists`. (Click for RailsGuides link!)](http://guides.rubyonrails.org/form_helpers.html#binding-a-form-to-an-object)

Write your `create` controller action to create a new `List` based on data from your form.

### STEP 6 – TODO ITEMS

In your `List` `show.html.erb` page, show all `Todo` items for your current `List`.

### STEP 7 – TODO NEW/CREATE

Write your `new` controller action and create your `new.html.erb` view for `Todos`.

[Use `form_for` to set up the new form for your `Todos`. (Click for RailsGuides link!)](http://guides.rubyonrails.org/form_helpers.html#binding-a-form-to-an-object)

To begin with, you should have `list_id` submitted through an input field in your form.

Write your `create` controller action to create a new `Todo` based on data from your form.

### BONUS

* Create a custom route so that the `list_id` populates automatically. Think about using a hidden field in your form.
* Give your lists `Tags`. This will be a `has_many` to `has_many` relationship, so you will need a join table.
* This is not a styling assignment, but feel free to link Bootstrap or Bootswatch in your `application.html.erb` file!
