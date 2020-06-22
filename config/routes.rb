Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do 
    authenticated :user do
      root to: 'posts#index'
    end
  end

  unauthenticated :user do
    root to: 'devise/registrations#new', as: :unauthenticated_root
  end
  
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
