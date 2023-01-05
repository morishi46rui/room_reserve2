Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }

  root 'homes#index'
  get 'search', to:'homes#search'
    
  get '/users', to: 'users#index'

  get 'users/profile'
  patch 'users/profile', to: 'users#update'

  get 'users/account'
  
  get 'users/rooms', to: 'users#show', as: 'users_show'

  get 'rooms/new'
  post 'rooms/new', to: 'rooms#create'

  get 'rooms/:id', to: 'rooms#show', as: 'room'
  post 'rooms/:id', to: 'reservations#confirm'

  get 'reservations/index'
  get '/reservations', to:'reservations#index'

  get 'reservations/:id', to: 'reservations#show', as: 'reservations_show'
  post 'reservations/:id', to: 'reservations#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
