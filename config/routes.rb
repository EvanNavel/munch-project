# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  # Redirect root path to "/posts"
  root to: redirect('/posts')

  resources :posts do
    # Routes for managing likes
    resource :like, only: [:create, :destroy]

    # Routes for managing favorites
    resource :favorite, only: [:create, :destroy]

    # Routes for managing forks
    resources :forks, only: [:new, :create] 

    # Routes for managing comments
    resources :comments

    # Custom member routes for flagging/unflagging posts
    member do
      post 'flag'
      post 'unflag'
    end

    # Custom collection route for searching posts
    collection do
      get 'search'
    end
  end

  resources :users, only: [:show] do
    resource :profile, only: [:show, :edit, :update]
    resources :follows, only: [:create, :destroy]

  end
end