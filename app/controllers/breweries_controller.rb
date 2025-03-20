class BreweriesController < ApplicationController
  def index
    @breweries = Brewery.limit(5)  # Only shows 5 on the homepage now
  end

  def show
    @brewery = Brewery.find(params[:id])
    @beers = @brewery.beers
  end

  def pubinfo  # New action for the full brewery listing page
    @breweries = Brewery.all
  end
end
