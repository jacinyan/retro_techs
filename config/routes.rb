Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users

  resources :items 
  resources :orders

  get 'carts/:id', to: 'carts#show', as: 'cart'
  delete 'carts/:id', to: 'carts#empty'

  post 'order_items', to: 'order_items#create'
  get 'order_items/:id', to: 'order_items#show', as: 'order_item'
  delete 'order_items/:id', to: 'order_items#destroy'


  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
