# frozen_string_literal: true

# require "resque/server"
Rails.application.routes.draw do

  # get 'search', to: 'users#index'

  get :search, controller: :users
  post "requests/approve_request", to: "requests#approve_request", as: "accept_req"
  unauthenticated do
    root "home#index"
  end
  authenticated do
    root "posts#index"
    # mount Resque::Server.new, at: "/jobs"
  end

  devise_for :users

  resources :users do
    collection do
      get "/feed", to: "users#feed", as: "pathfeed"
    end
    resources :stories, only: %i[index new destroy show create]
  end
  resources :posts do
    resources :comments
  end

  resources :likes, only: %i[create destroy]
  resources :users, only: %i[show]
  resources :friendships, only: %i[create destroy]

  resources :requests, only: %i[index create destroy edit]

  get "home/index"
  get "/users", to: "home#index"
  match "/404", to: "errors#not_found", via: :all
  match "/404", to: "errors#not_found", via: :all
end
