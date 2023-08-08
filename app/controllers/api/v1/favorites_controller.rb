class Api::V1::FavoritesController < ApplicationController
  rescue_from NoMethodError, with: :render_invalid_response

  def index
    user = User.find_by(api_key: params[:api_key])
    user_favorites = user.favorites

    render json: FavoriteSerializer.new(user_favorites)
  end


  def create
    user = User.find_by(api_key: params[:api_key])
    new_fav = Favorite.new(fav_params)
    new_fav.update(user_id: user.id)
    render json: { success: "Favorite added successfully" }, status: 201
  end

  private

  def render_invalid_response(message)
    render json: { error: "Can't Find User"}, status: 400
  end

  def fav_params
    params.permit(:country, :recipe_link, :recipe_title, :user_id)
  end

end