require "rails_helper"

RSpec.describe "recipe service" do
  it "returns a list of recipes", :vcr do
    search = RecipeService.new.recipe_search("Thailand")
    recipe_1 = search[:hits].first[:recipe]

    expect(search).to be_a(Hash)
    expect(search).to have_key(:count)
    expect(search[:count]).to be_an(Integer)
    expect(search).to have_key(:hits)
    expect(search[:hits]).to be_an(Array)
    expect(search[:hits].first).to be_a(Hash)
    expect(search[:hits].first).to have_key(:recipe)

    expect(recipe_1[:label]).to be_a(String)
    expect(recipe_1[:label]).to eq("Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
    expect(recipe_1).to have_key(:url)
    expect(recipe_1[:url]).to be_a(String)
    expect(recipe_1[:url]).to eq("https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html")
    expect(recipe_1).to have_key(:image)
    expect(recipe_1[:image]).to be_a(String)
  end
end