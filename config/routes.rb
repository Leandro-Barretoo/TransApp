Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  authenticated :user do
    root to: 'groups#index', as: :authenticated_root
  end

  resources :groups
  resources :buys
end
