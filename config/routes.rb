Rails.application.routes.draw do

  resources :stickers
  resources :albums
  get 'user/profile' => 'users/user#profile'
  get 'user/stickers' => 'users/user#stickers'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
