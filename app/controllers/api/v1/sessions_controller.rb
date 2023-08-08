class Api::V1::SessionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_invalid_response

  def create
    @user = User.find_by!(email: params[:session][:email])

    if @user.authenticate(params[:session][:password])
      render json: UserSerializer.new(@user), status: 201
    else
      render_invalid_response
    end

    def render_invalid_response
      render json: { error: "Invalid credentials" }, status: 400
    end

  end
end