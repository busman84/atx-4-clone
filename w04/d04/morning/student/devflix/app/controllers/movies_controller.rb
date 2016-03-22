class MoviesController < ApplicationController
  set :views, Proc.new { File.join(root, "views/movies") }

  get '/movies' do
    @movies = Movie.all
    erb :index
  end

  post '/movies' do
    movie = Movie.new(params["movie"])
    movie.save

    redirect "/movies/#{movie.id}"
  end

  get '/movies/new' do
    erb :new
  end

  get '/movies/:id/edit' do
    @movie = Movie.find(params["id"])
    erb :edit
  end

  get '/movies/:id' do
    @movie = Movie.find(params["id"])
    erb :show
  end

  patch '/movies/:id' do
    movie = Movie.find(params["id"])
    movie.update(params["movie"])
    movie.save

    redirect "/movies/#{movie.id}"
  end

  delete '/movies/:id' do
    movie = Movie.find(params["id"])
    movie.destroy

    redirect "/movies"
  end
end
