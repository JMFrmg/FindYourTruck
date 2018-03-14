Rails.application.routes.draw do



  devise_for :foodtruckers
  devise_for :admins
  devise_for :users
  root 'home#index'

  resources :menus
  resources :dishs

  get '/show', to: 'home#show'

end
