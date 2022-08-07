# frozen_string_literal: true

Rails.application.routes.draw do
  get '/users/feed', to: 'users#feed', as: 'pathfeed'
  get 'search', to: 'users#index'
  unauthenticated do
    root 'home#index'
  end
  authenticated do
    root 'posts#index'
  end

  devise_for :users do
    # :posts
  end
  resources :posts do
    resources :comments
  end

  resources :likes, only: %i[create destroy]
  resources :users ,only: %i[show]

  get 'home/index'
  get '/users', to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
