Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users
  resources :items
  resources :orders, :only => [:index, :show, :create]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
