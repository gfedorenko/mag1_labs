module V1
  class RowsController < ApplicationController
    before_action :set_row, only: [:show, :update, :destroy]

    def index
      @rows = Row.where(table_id: params[:table_id]).paginate(page: params[:page], per_page: 20)
      render json: @rows
    end

    def show
      json_response(@row)
    end

    def create
      @row = Row.create_cells(row_params)
      json_response(@row, :created)
    end

    def update
      @row.update(row_params)
      head :no_content
    end

    def destroy
      @row.destroy
      head :no_content
    end

    private

    def row_params
      params.permit(:table_id, values: [:field_name, :value])
    end

    def set_row
      @row = Row.find(params[:id])
    end
  end
end