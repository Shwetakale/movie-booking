# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :movies, only: [:index] do
    resources :screens, only: [:index]
  end

  resources :movie_screens, only:[] do
    resources :reservations, only: [:index] do
      get :book
      collection do
        post 'cart_action'
      end
    end
  end

  resources :reports, only: [:index]

  authenticated :user, ->(u) { u.admin? } do
    root to: 'reports#index', as: "admin-reports"
  end

  authenticated :user, ->(u) { u.customer? } do
    root to: 'movies#index', as: "dashboard"
  end

  devise_scope :user do
    root "devise/sessions#new"
  end
end
