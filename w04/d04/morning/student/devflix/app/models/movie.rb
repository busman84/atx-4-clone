class Movie < ActiveRecord::Base
  has_many :theater_movies
  has_many :theaters, through: :theater_movies
end
