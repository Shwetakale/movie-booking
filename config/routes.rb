# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :movies, only: [:index] do
    resources :screens, only: [:index]
    resources :reports, only: [:index]
  end

  resources :movie_screens, only:[] do
    resources :reservations, only: [:index] do
      member do
        get :book
        get :order
      end
      collection do
        post 'cart_action'
        post 'clear_cart'
      end
    end
  end

  resources :users, only: [:index] do
    resources :reports, only: [] do
      collection do 
        get :bookings
      end
    end
  end

  authenticated :user, ->(u) { u.customer? } do
    root to: 'movies#index', as: "dashboard"
  end

  devise_scope :user do
    root "devise/sessions#new"
  end
end
