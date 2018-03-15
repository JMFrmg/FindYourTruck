Rails.application.routes.draw do


  devise_for :foodtruckers
  devise_for :admins
  devise_for :users
  root 'home#index'
  get 'home/show/:id', to: 'home#show'
  resources :foodtruckers
  resources :menus
  resources :dishs


end
