Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :users
  resources :users
  resources :foods
  resources :recipes, only: %i[index show new create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
  resources :recipes do
    # resources :recipe_food, only: [:show, :new, :create, :edit, :update, :destroy]
    member do
      get :delete
    end
  end
end
=======
  root 'foods#index'
  devise_for :users
  # resources :users
  resources :foods

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
>>>>>>> 38ac739680ed8efea405d95ad9337f723384fb31
