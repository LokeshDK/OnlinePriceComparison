Rails.application.routes.draw do
  resources :store_infos, :path=> 'storeInfo'
  resources :users
  get '/users/:id/account', to: 'users#account'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
