Rails.application.routes.draw do

  resources :stickers
  resources :albums
  resources :album_pages
  get '/', to: 'users/user#profile'
  get 'user/profile' => 'users/user#profile'
  get 'user/stickers' => 'stickers#stickers'
  get 'user/albums' => 'albums#albums'
  get 'albums/:album_id/stickers' => 'stickers#index', as: 'album_stickers'
  get 'albums/:album_id/stickers/new' => 'stickers#new', as: 'stickers_new'
  get 'user/albums/:album_id' => 'albums#album', as: 'user_album'
  get 'user/albums/:album_id/pages' => 'album_pages#index', as: 'show_album_pages'
  get 'user/albums/:album_id/edit-pages' => 'album_pages#edit_pages', as: 'edit_album_pages'
  get 'user/albums/:album_id/edit-pages/:page_number/add-sticker' => 'album_pages#add_sticker', as: 'add_sticker_album_page'
  get 'user/albums/:album_id/edit-pages/:page_number/edit-sticker-position' => 'album_pages#edit_sticker_position', as: 'edit_sticker_position_album_page'
  delete 'user/albums/:album_id/edit-pages/:page_number/remove-sticker/:sticker_id' => 'album_pages#remove_sticker_from_page', as: 'remove_sticker_from_page_album_page'
  post 'user/albums/:album_id/edit-pages/:page_number/add-sticker' => 'album_pages#add_sticker_to_page', as: 'add_sticker_to_page_album_page'
  get 'user/:user_id/albums' => 'albums#specific_user_albums', as: 'specific_user_albums'
  get 'user/:user_id/albums/:album_id' => 'albums#specific_user_album', as: 'specific_user_album'
  get 'user/:user_id/albums/:album_id/exchange' => 'exchange#index', as: 'exchange'
  post 'user/:user_id/albums/:album_id/exchange' => 'exchange#new', as: 'exchange_new'
  get 'user/exchanges/:exchange_id' => 'exchange#show', as: 'exchange_show'
  get 'user/exchanges' => 'exchange#all', as: 'all_exchanges'
  put 'user/exchanges/:exchange_id/cancel' => 'exchange#cancel', as: 'cancel_exchange'
  put 'user/exchanges/:exchange_id/refuse' => 'exchange#refuse', as: 'refuse_exchange'
  put 'user/exchanges/:exchange_id/accept' => 'exchange#accept', as: 'accept_exchange'
  get 'user/albums/:album_id/new_stickers' => 'stickers#new_stickers', as: 'new_stickers_page'
  # get 'users/sign_out' => 'users/user#

  get 'how_it_works' => "users/user#how_it_works", as: "how_it_works"

  post 'user/albums/:album_id/pages' => 'stickers#open_sticker_pack', as: 'open_sticker_pack'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
