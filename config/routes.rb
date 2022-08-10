# frozen_string_literal: true

Rails.application.routes.draw do
  get '/users/feed', to: 'users#feed', as: 'pathfeed'
  get 'search', to: 'users#index'
  post '/requests/approve_request', to: 'requests#approve_request', as: 'accept_req'
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

  resources :stories, only: %i[create index new destroy show]

  resources :likes, only: %i[create destroy]
  resources :users, only: %i[show]
  resources :friendships, only: %i[create destroy]
  resources :requests, only: %i[index create destroy edit]

  get 'home/index'
  get '/users', to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
