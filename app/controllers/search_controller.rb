class SearchController < ApplicationController
    def results
      query = params[:q]
  
      if query.present?
        @beers = Beer.where("name ILIKE ?", "%#{query}%")  # Case-insensitive search for beers
        @breweries = Brewery.where("name ILIKE ?", "%#{query}%") # Case-insensitive search for breweries
      else
        @beers = []
        @breweries = []
      end
    end
  end
  