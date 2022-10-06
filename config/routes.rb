Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :foods
  resources :recipes, only: %i[index show new create]
  resources :shopping_list, only: %i[show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'foods#index'
  resources :recipes do
    # resources :recipe_food, only: [:show, :new, :create, :edit, :update, :destroy]
    member do
      get :delete
    end
  end
end
