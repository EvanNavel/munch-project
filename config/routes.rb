Rails.application.routes.draw do
  devise_for :users

  root to: redirect('/posts')

  resources :posts do
    resources :forks, only: [:new, :create] 
    resource :like, only: [:create, :destroy]
    resources :comments
    member do
      post 'flag'
      post 'unflag'
    end
  end
end
