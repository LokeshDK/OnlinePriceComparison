Rails.application.routes.draw do
  get 'carts/show'
  get 'compare/index'

  resources :profiles
  devise_for :users
  get 'productinfos_imports/new'
  get 'productinfos_imports/create'
  #resources :productinfos
  #resources :categories

  resources :storeinfos
  resources :branchinfos
  resources :productinfos
  resources :productinfos_imports, only: [:new, :create]
  resources :places
  get '/locator', to: 'places#locator'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :order_items
  resources :carts, only:[:show]
  get '/check' =>'places#checkStore'
  #validate that a number is even
  post '/results', :controller=>'places', :action=>'locator'
  post '/details', :controller=>'places', :action=>'details'

  resources :users
  get '/users/:id/account', to: 'users#account'

  get 'home/Index'

  root to: 'home#Index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
