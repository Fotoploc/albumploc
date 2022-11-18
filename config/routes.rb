Rails.application.routes.draw do

  resources :stickers
  resources :albums
  get 'user/profile' => 'users/user#profile'
  get 'user/stickers' => 'users/user#stickers'
  get 'user/albums' => 'users/user#albums'
  get 'user/albums/:id' => 'users/user#album', as: 'user_album'
  get 'user/:id/albums' => 'users/user#specific_user_albums', as: 'specific_user_albums'
  get 'user/:id/albums/:album_id' => 'users/user#specific_user_album', as: 'specific_user_album'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
