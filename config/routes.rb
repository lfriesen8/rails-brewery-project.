Rails.application.routes.draw do
  get "/about", to: "pages#about"
  get "/pubs", to: "breweries#pubinfo"  # New route for pubs page
  
  root "breweries#index"  # Home page remains the same
  
  resources :breweries, only: [:index, :show]  
  resources :beers, only: [:index, :show]

  # DONT FORGET TO ADD THIS: Route for Search Functionality
  get "/search", to: "search#results"
end