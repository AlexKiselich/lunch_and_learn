require "rails_helper"

RSpec.describe Recipe do
  it "exists and has attributes" do
    data = {
      :recipe => {
        :id => nil,
        :type => "recipe",
        :label => "Andy Ricker's Phrik Naam Som (Vinegar-Soaked Chiles)",
        :url => "http://www.seriouseats.com/recipes/2013/11/andy-rickers-phrik-naam-som-vinegar-soaked-chiles.html",
        :image => "https://edamam-product-images.s3.amazonaws.com/"
      }
    }

    recipe = Recipe.new(data, "Thailand")

    expect(recipe).to be_a(Recipe)
    expect(recipe.title).to eq("Andy Ricker's Phrik Naam Som (Vinegar-Soaked Chiles)")
    expect(recipe.url).to eq("http://www.seriouseats.com/recipes/2013/11/andy-rickers-phrik-naam-som-vinegar-soaked-chiles.html")
    expect(recipe.country).to eq("Thailand")
    expect(recipe.image).to eq("https://edamam-product-images.s3.amazonaws.com/")
  end
end