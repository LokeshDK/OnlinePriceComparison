Rails.application.routes.draw do
  #resources :productinfos
  #resources :categories

  resources :storeinfos do
    resources :branchinfos do
      resources :productinfos
    end
  end

 # resources :branchinfos do
  #  resources :productinfos
 # end

  resources :users
  get '/users/:id/account', to: 'users#account'

  root to: 'storeinfos#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
