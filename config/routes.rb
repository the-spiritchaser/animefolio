Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users, only: [:index, :show, :edit, :update]
  resources :posts, only: [:index, :new, :create]
  resources :rooms, only: [:show, :create]
end
