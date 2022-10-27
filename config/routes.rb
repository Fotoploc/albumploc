Rails.application.routes.draw do

  resources :photos
  resources :albums
  devise_for :views
  get 'user/profile' => 'users/user#profile'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root 'home#index', as: 'root'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
