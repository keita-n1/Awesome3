Rails.application.routes.draw do
  devise_for :users
  resources :coordinates, only: [:index, :create]
  resources :users, only: [:create, :show, :edit, :update] do
    resources :coordinates, only: [:new] do
      resources :comments, only: [:index, :create]
    end
  end

  resources :likes, only: [:create, :destroy]
  
  root "coordinates#index"
end
