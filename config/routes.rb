Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', registration: 'register' }

  namespace :admin do
    resources :dashboard,   only: %i(index)
    resources :users,       only: %i(index show)
    resources :categories,  only: %i(index destroy edit update new create)
    resources :products,    only: %i(index destroy edit update new create)
    resources :orders,      only: %i(index)
  end
  resources :home,             only: %i(index)
  resources :carts,            only: %i(index)
  resources :categories,       only: %i(show)
  resources :products,         only: %i(index show)
  resources :cart_items,       only: %i(create update destroy)
  resources :orders,           only: %i(new create)
  resources :users,            only: %i(show update)
  resources :addresses,        only: %i(new create edit update)
  get "*path", to: "application#page_404"
end
