require 'sinatra'
require 'sinatra/reloader'

enable :sessions

before do 
	session[:cart] ||= []
end

get '/' do
	erb :index
end

get '/add_item' do 
	erb :add_item
end

get '/logout' do 
	session.clear

	redirect '/'
end

post '/add_item' do
	session[:cart].push params[:item_name]
	session[:recent_item] = params[:item_name]

	redirect '/add_item_success'
end

get '/add_item_success' do 
	@item = session[:recent_item]

	erb :add_item_success
end

get '/cart' do 
	@items = session[:cart]

	erb :cart
end



