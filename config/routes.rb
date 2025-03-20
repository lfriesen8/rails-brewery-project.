Rails.application.routes.draw do
  root "breweries#index"
  resources :breweries, only: [:index, :show]
  resources :beers, only: [:index, :show]
end
