Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'posts#index'
  resources :posts
  resources :users
  resources :friends
  get 'edit_profile_image', to: 'users#edit_profile_image'
  post 'friend_request', to: 'friends#new_request'
  post 'accept_request', to: 'friends#accept_request'
  post 'ignore_request', to: 'friends#ignore_request'
  post 'like', to: 'posts#like'
  post 'new_comment', to: 'posts#new_comment'
end
