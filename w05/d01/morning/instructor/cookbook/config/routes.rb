Rails.application.routes.draw do

  resources :photos

  # get 'recipes/show'
  # get 'recipes/index'
  resources :recipes

  # get '/', to: 'recipes#index'
  root 'recipes#index'

  get '/about' => 'recipes#about'

end
