class Api::V1::RecipesController < ApplicationController
  def index
    if params[:country].present?
      recipes = RecipeFacade.new.get_recipes(params[:country])
      render json: RecipeSerializer.new(recipes)
    else
      country = CountryFacade.new.random_country
      recipes = RecipeFacade.new.get_recipes(country.name)
      render json: RecipeSerializer.new(recipes)
    end
  end
end