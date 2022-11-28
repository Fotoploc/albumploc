Rails.application.routes.draw do

  resources :stickers
  resources :albums
  get 'user/profile' => 'users/user#profile'
  get 'user/stickers' => 'users/user#stickers'
  get 'user/albums' => 'users/user#albums'
  get 'user/albums/:album_id' => 'users/user#album', as: 'user_album'
  get 'user/:user_id/albums' => 'users/user#specific_user_albums', as: 'specific_user_albums'
  get 'user/:user_id/albums/:album_id' => 'users/user#specific_user_album', as: 'specific_user_album'
  get 'user/:user_id/albums/:album_id/exchange' => 'exchange#index', as: 'exchange'
  post 'user/:user_id/albums/:album_id/exchange' => 'exchange#new', as: 'exchange_new'
  get 'user/exchanges' => 'exchange#all', as: 'all_exchanges'
  put 'user/exchanges/:exchange_id/cancel' => 'exchange#cancel', as: 'cancel_exchange'
  put 'user/exchanges/:exchange_id/refuse' => 'exchange#refuse', as: 'refuse_exchange'
  put 'user/exchanges/:exchange_id/accept' => 'exchange#accept', as: 'accept_exchange'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
