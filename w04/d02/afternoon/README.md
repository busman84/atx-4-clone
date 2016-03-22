# ActiveRecord: Part Two

## Associations

#### Belongs To and Has Many

* Inverse operations – demonstrate them
* Belongs to has the key! SO IMPORTANT.
* What methods do we get?
  * `Book` `belongs_to :author`
    * `book.author_id`
    * `book.author`
  * `Author` `has_many :books`
    * `author.books`
* Now let's add `Category`
* We need a `category_books` join table, and a `CategoryBook` model
* Keys go in the join table, so the join model gets the `belongs_to` – consequently, other models are `has_many`
* What methods do we get?
  * `CategoryBook` `belongs_to :book`
    * `category_book.book_id`
    * `category_book.book`
  * `Book` `has_many :category_books`
    * `book.category_books`
  * These aren't very useful right now!

#### Has Many Through and Has and Belongs To Many

* We want to know the categories for books and the books for categories!
* What methods do we get?
  * `Book` `has_many :categories, through: :book_categories`
    * `book.categories`
  * `Category` `has_many :books, through: :book_categories`
    * `category.books`
* Use `has_and_belongs_to_many` if you don't need the join model


#### Ticketing Code-Along

* Set up `Event`, `Ticket`, `User`, where `Ticket` is the join model/table

----

## Validations, Callbacks, Named Scope, Queries

**ACTIVITY: Break into groups and add one of the following to our Ticketing Code-Along (20 minutes)**

#### Validations

#### Callbacks

#### Named Scope

#### Queries
