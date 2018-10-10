Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :accounts
  resources :bank
  resources :branches
  resources :cards
  resources :clients
  resources :loans 
  resources :transections
end
