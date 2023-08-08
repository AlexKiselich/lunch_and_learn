require 'rails_helper'

RSpec.describe 'Favorites API' do
  describe 'POST /api/v1/favorites' do
    it 'creates a favorite for a user' do

      fav_params = {
                    "api_key": "fd1b4597c8497484027e4a321d33cd23",
                    "country": "thailand",
                    "recipe_link": "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
                    "recipe_title": "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)"
                    }

      headers = { 'CONTENT_TYPE' => 'application/json' }
      post '/api/v1/favorites', headers: headers, params: JSON.generate(fav_params)

      created_user = User.last
      json = JSON.parse(response.body, symbolize_names: true)

    end
  end
end