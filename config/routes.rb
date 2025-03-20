Rails.application.routes.draw do
  get "/about", to: "pages#about"  # Ensure the About page is accessible

  root "breweries#index"  # Keep breweries as the homepage
  resources :breweries, only: [:index, :show]
  resources :beers, only: [:index, :show]
end
