Rails.application.routes.draw do
  resources :profiles
  root 'welcome#index'

  devise_for :users
  resources :items 
  resources :orders


  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
