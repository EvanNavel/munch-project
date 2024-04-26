Rails.application.routes.draw do
  devise_for :users

  # Redirect root path to "/posts"
  root to: redirect('/posts')

  resources :posts do
    # Routes for managing likes
    resource :like, only: [:create, :destroy]

    # Routes for managing favorites
    resource :favorite, only: [:create, :destroy]

    # Routes for managing forks, added :show
    resources :forks, only: [:new, :create, :show]

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

  # Routes for user profiles
  resources :users, only: [:show] do
    resource :profile, only: [:show, :edit, :update]
  end

end
