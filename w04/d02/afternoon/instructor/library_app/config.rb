require 'active_record'
require 'pg'

require_relative 'sql.rb'

ActiveRecord::Base.establish_connection(
  adapter:  'postgresql',
  database: 'lecture',
  host:     'localhost'
)

require_relative 'models/book.rb'
require_relative 'models/author.rb'
require_relative 'models/category.rb'
require_relative 'models/category_book.rb'

Book.create(title: "Harry Potter", author_id: 1)
Book.create(title: "Lord of the Rings", author_id: 3)
Book.create(title: "Saw", author_id: 3)

Author.create(name: "Amanda")
Author.create(name: "Mike")
Author.create(name: "Britney Jo")

fiction = Category.create(name: "Fiction")
fantasy = Category.create(name: "Fantasy")

CategoryBook.create(category_id: 1, book_id: 1)
CategoryBook.create(category_id: 1, book_id: 2)
CategoryBook.create(category_id: 2, book_id: 1)
