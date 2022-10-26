Rails.application.routes.draw do

  resources :stickers
  resources :albums
  devise_for :views
  get 'user/profile' => 'users/user#profile'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
