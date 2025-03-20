class BreweriesController < ApplicationController
  def index
    @breweries = Brewery.all
  end

  def show
    @brewery = Brewery.find(params[:id])
    @beers = @brewery.beers
  end
end
