module V1
  class DatabasesController < ApplicationController
  before_action :set_database, only: [:show, :update, :destroy]

  def index
    @databases = Database.all.includes(:tables).paginate(page: params[:page], per_page: 20)
    render json: @databases, include: 'tables'
  end

  def show
    json_response(@database)
  end

  def create
    @database = Database.create!(database_params)
    json_response(@database, :created)
  end

  def update
    @database.update(database_params)
    head :no_content
  end

  def destroy
    @database.destroy
    head :no_content
  end

  private

  def database_params
    params.permit(:name)
  end

  def set_database
    @database = Database.find(params[:id])
  end
  end
end
