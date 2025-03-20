Rails.application.routes.draw do
  get "/about", to: "pages#about"

  root "breweries#index"

  resources :breweries, only: [:index, :show]
  resources :beers, only: [:index, :show]

  # Search routes
  get "/search", to: "search#index"  
end
