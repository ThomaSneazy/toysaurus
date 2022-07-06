Rails.application.routes.draw do
  get 'bookings/create'
  devise_for :users
  root to: 'toys#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :toys, except: :destroy do
    resources :bookings, only: %i[new create edit update show]
    resources :reviews, only: %i[new create edit update]
  end
  resources :bookings, only: [:destroy]
  resources :reviews, only: [:destroy]
end
