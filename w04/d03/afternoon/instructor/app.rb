require 'sinatra'
require 'sinatra/reloader'

get '/' do 
  @first_name = params[:first_name]
  @last_name = params[:last_name]

  erb :index
end

get '/name/:banana' do 
  "Your name must be #{params[:banana].capitalize}"
end

get '/courses' do 
  @courses = ['WDI', 'UXDI', 'Math', 'Biology']

  erb :course
end

post '/courses' do 
  # Add code to save what the user input to the database
  new_course_name = params[:course_name]

  "Thanks for adding #{new_course_name}"
end

put '/courses/:id' do 

end

get '/courses/new' do 
  erb :course_form
end