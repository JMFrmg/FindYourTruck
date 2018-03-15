Rails.application.routes.draw do


  post 'carts/adddish/:id', to: 'carts#adddish', as: 'addtocart'

  post 'carts/removedish/:id', to: 'carts#removedish', as: 'removedish'

  devise_for :foodtruckers
  devise_for :admins
  devise_for :users
  root 'home#index'
  get 'home/show/:id', to: 'home#show'
  resources :foodtruckers
  resources :menus
  resources :dishs


end
