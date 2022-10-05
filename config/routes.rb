Rails.application.routes.draw do
  get 'shopping_list/show'
  get 'recipe_foods/new'
  resources :foods
  devise_for :users
  resources :recipes, only: %i[index show new create destroy put] do
    resources :recipe_foods, path: 'food', only: %i[destroy new create]
  end

  match 'recipes/:recipe_id' => 'recipes#toogle_public', as: :toogle_public, via: :patch
  match 'public_recipes' => 'recipes#public_recipes', as: :public_recipes, via: :get

  root 'recipes#public_recipes'
end
