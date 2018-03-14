Rails.application.routes.draw do


  devise_for :foodtruckers
  devise_for :admins
  devise_for :users
  root 'home#index'

  get 'home/show/:id(.:format)', to: 'home#show'

  resources :menus
  resources :dishs


end
