Rails.application.routes.draw do

  get 'admins/edit_users'

  devise_for :foodtruckers

  devise_for :admins
  devise_for :users
  root 'home#index'
  get 'home/show/:id', to: 'home#show', as: 'showfoodtrucker'
  post 'foodtruckers/address/:id', to: 'foodtruckers#addaddress', as: 'addaddress'
  post 'foodtruckers/beactual/:id', to: 'foodtruckers#beactual', as: 'beactual'
  post 'foodtruckers/beunactual/:id', to: 'foodtruckers#beunactual', as: 'beunactual'
  post 'foodtruckers/:id/addphoto/', to: 'foodtruckers#addphoto', as: 'addphoto'
  post 'foodtruckers/removephoto/:id', to: 'foodtruckers#removephoto', as: 'removephoto'
  get 'generalsearch', to: 'foodtruckers#generalsearch'
  resources :foodtruckers
  resources :menus
  resources :dishs

  post 'carts/adddish/:id', to: 'carts#adddish', as: 'addtocart'
  post 'carts/removedish/:id', to: 'carts#removedish', as: 'removedish'
  post 'carts/buy/:id', to: 'carts#buy', as: 'buycart'


end
