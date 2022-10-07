Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :foods

  resources :recipes, only: %i[index show new create destroy put] do
    resources :recipe_foods, path: 'food', only: %i[destroy new create]
  end

  match 'recipes/:recipes_id' => 'recipes#toogle_public', as: :toogle_public, via: :patch
  match 'public_recipes' => 'recipes#public_recipes', as: :public_recipes, via: :get

  resources :recipes, only: %i[index show new create]

  resources :shopping_list, only: %i[show]

  resources :public_recipes, only: %i[index]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'foods#index'
  resources :recipes do
    # resources :recipe_food, only: [:show, :new, :create, :edit, :update, :destroy]
    member do
      get :delete
    end
  end

  # match 'public_recipes' => 'recipes#public_recipes', as: :public_recipes, via: :get
end
