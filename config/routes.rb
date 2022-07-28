# frozen_string_literal: true

Rails.application.routes.draw do


  unauthenticated do
    root 'home#index'
  end
  authenticated do
    root 'posts#index'
  end

  devise_for :users do
    # :posts
  end
  resources :posts


  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
