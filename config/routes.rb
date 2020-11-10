Rails.application.routes.draw do
  resources :cart_items
  resources :shopping_carts
  root 'items#index'
  devise_for :users
  resources :items
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
