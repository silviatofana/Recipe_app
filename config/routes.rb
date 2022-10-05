Rails.application.routes.draw do
  root 'foods#index'
  devise_for :users
  # resources :users
  resources :foods

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
