Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :update, :destroy]
      resources :logs, only: [:index, :create, :destroy]
      resources :orders, only: [:index, :create, :update, :destroy]
    end
  end
end
