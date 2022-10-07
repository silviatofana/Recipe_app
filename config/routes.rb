Rails.application.routes.draw do
  get 'shopping_list/show'
  get 'recipe_foods/new'
  resources :foods
<<<<<<< HEAD
=======

devise_for :users
  resources :recipes, only: %i[index show new create destroy put] do
    resources :recipe_foods, path: 'food', only: %i[destroy new create]
  end

  match 'recipes/:recipe_id' => 'recipes#toogle_public', as: :toogle_public, via: :patch
  match 'public_recipes' => 'recipes#public_recipes', as: :public_recipes, via: :get

  root 'recipes#public_recipes'
end

>>>>>>> 3a3ce0d5a52d4d7a1b40739f8c5acf70ab434aaf
  resources :recipes, only: %i[index show new create]
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
<<<<<<< HEAD
=======

>>>>>>> 3a3ce0d5a52d4d7a1b40739f8c5acf70ab434aaf
