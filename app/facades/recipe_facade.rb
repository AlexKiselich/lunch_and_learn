class RecipeFacade
  def get_recipes(country)
    request = service.recipe_search(country)
    recipes = request[:hits].map do |data|
      Recipe.new(data, country)
    end
  end

  def service
    RecipeService.new
  end
end