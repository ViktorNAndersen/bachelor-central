Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show]
      resources :logs, only: [:index, :show, :create, :destroy]
      resources :orders
      resources :locations, only: [:index, :show]
      resources :products, only: [:index]
      resources :ping, only: [:index]
    end
  end
end
