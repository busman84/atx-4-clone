class MoviesController < ApplicationController
  set :views, Proc.new { File.join(root, "views/movies") }

  get '/movies' do
    # INDEX
    @movies = Movie.all
    erb :index
  end

  get '/movies/new' do
    # NEW
    erb :new
  end

  get '/movies/:id/edit' do
    # EDIT
    @movie = Movie.find(params[:id])
    erb :edit
  end

  get '/movies/:id' do
    # SHOW
    @movie = Movie.find(params[:id])
    erb :show
  end

  post '/movies' do
    # CREATE
    @movie = Movie.new(params["movie"])

    if @movie.save
      redirect '/movies'
    else
      puts "Invalid movie!"
      redirect '/movies/new'
    end
  end

  patch '/movies/:id' do
    # UPDATE
    @movie = Movie.find(params["id"])
    @movie.update(params["movie"])

    redirect '/movies'
  end

  delete '/movies/:id' do
    # DELETE
    @movie = Movie.find(params["id"])
    @movie.destroy

    redirect '/movies'
  end
end
