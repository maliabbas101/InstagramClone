# frozen_string_literal: true

Rails.application.routes.draw do
  unauthenticated do
    root controller: :home , action: :index
  end
  authenticated do
    root controller: :posts , action: :index
  end
  devise_for :users

  resources :users, only: %i[] do
    collection do
      get "/feed", to: "users#feed", as: "pathfeed"
    end
    resources :stories, only: %i[index new destroy show create]
  end

  resources :posts do
    resources :comments, only: %i[new edit create update destroy]
  end

  resources :likes, only: %i[create destroy]
  resources :users, only: %i[show]
  resources :friendships, only: %i[create destroy]
  resources :requests, only: %i[index create destroy] do
    member do
      post :edit
    end
  end
  get :search, controller: :users
end
