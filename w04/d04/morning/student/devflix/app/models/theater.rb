class Theater < ActiveRecord::Base
  has_many :theater_movies
  has_many :movies, through: :theater_movies
end
