# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
  root to: redirect('/home')
  get 'home', to: 'pages#home', as: 'home'
  



















  
  #Commenting
  get '/recipes/:recipe_id/comments', to: 'comments#index', as: 'recipe_comments'
  post '/recipes/:recipe_id/comments', to: 'comments#create'
  patch '/comments/:id', to: 'comments#update', as: 'update_comment'

  #Flagging
    patch 'recipes/:id/flag', to: 'recipes#flag', as: 'flag_recipe'
    patch 'recipes/:id/unflag', to: 'recipes#unflag', as: 'unflag_recipe'
  
  
end
