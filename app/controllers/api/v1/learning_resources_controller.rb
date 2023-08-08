class Api::V1::LearningResourcesController < ApplicationController
  def index
    learning_resources = LearningResourcesFacade.new(params[:country])
    render json: LearningResourcesSerializer.new(learning_resources)
  end
end