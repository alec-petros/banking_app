Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/banks/:id/create_account", to: "banks#create_account"

  resources :cities
  resources :banks
  resources :accounts
  resources :customers
end
