Rails.application.routes.draw do


  

  devise_for :foodtruckers, controllers: {
             :registrations => "foodtruckers/registrations"}
  devise_for :admins
  devise_for :users
  root 'home#index'
  get 'home/show/:id', to: 'home#show', as: 'showfoodtrucker'
  resources :foodtruckers
  resources :menus
  resources :dishs

  post 'carts/adddish/:id', to: 'carts#adddish', as: 'addtocart'
  post 'carts/removedish/:id', to: 'carts#removedish', as: 'removedish'
  post 'carts/buy/:id', to: 'carts#buy', as: 'buycart'


end
