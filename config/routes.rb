Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#index"

  resources :users  , only: [:show, :index] do
    resources :posts  , only: [:show, :index]
  end
end
