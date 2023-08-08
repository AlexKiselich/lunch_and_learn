class Api::V1::UsersController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response

  def create
    @user = User.create!(user_params)
    @user.update(api_key: SecureRandom.hex)

    render json: UserSerializer.new(@user), status: 201
  end

  def render_invalid_response(error)
    render json: { error: error.message }, status: 400
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end