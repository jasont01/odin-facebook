Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'posts#index'
  resources :posts
  resources :users
  post 'friend_request', to: 'friends#new_request'
  post 'accept_request', to: 'friends#accept_request'
end
