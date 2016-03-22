class Book < ActiveRecord::Base
  belongs_to :author
  has_many :category_books
  has_many :categories, through: :category_books
end
