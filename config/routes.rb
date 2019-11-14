Rails.application.routes.draw do
  get 'productinfos_imports/new'
  get 'productinfos_imports/create'
  #resources :productinfos
  #resources :categories

  resources :storeinfos
  resources :branchinfos
  resources :productinfos
  resources :productinfos_imports, only: [:new, :create]



 # resources :branchinfos do
  #  resources :productinfos
 # end

  resources :users
  get '/users/:id/account', to: 'users#account'

  root to: 'storeinfos#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
