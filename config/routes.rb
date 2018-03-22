Rails.application.routes.draw do

  get 'admins/edit_users'

  devise_for :foodtruckers

  devise_for :admins
  devise_for :users
  root 'home#index'
  get 'home/show/:id', to: 'home#show', as: 'showfoodtrucker'
  post 'home/deletefavorite/:id', to: 'home#delete_favorite', as: 'deletefavorite'
  post 'home/addfavorite/:id', to: 'home#add_to_favorites', as: 'addfavorite'
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

  get 'admins/index', to: 'admins#index', as: 'adminsindex'
  get 'admins/foodtrucker/:id', to: 'admins#edit_foodtrucker', as: 'admin_edit_foodtrucker'
  get 'admins/user/:id', to: 'admins#edit_user', as: 'admin_edit_user'


end
