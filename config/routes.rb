# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: redirect('/posts')
  get 'posts', to: 'posts#index', as: 'user_posts'
  get 'posts/:id',to: 'posts#show', as: 'show_posts'
end
