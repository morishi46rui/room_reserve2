Rails.application.routes.draw do

  root 'homes#index'
  devise_for :users

  get '/users', to: 'users#index'

  get 'users/profile'
  patch 'users/profile', to: 'users#update'

  get 'users/account'
  
  get 'users/rooms', to: 'users#show', as: 'users_show'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
