module V1
  class HeadersController < ApplicationController
    before_action :set_header, only: [:show, :update, :destroy]

    def index
      @headers = Header.where(table_id: params[:table_id]).paginate(page: params[:page], per_page: 20)
      render json: @headers
    end

    def show
      json_response(@header)
    end

    def create
      @header = Header.create_with_header(header_params)
      json_response(@header, :created)
    end

    def update
      @header.update(header_params)
      head :no_content
    end

    def destroy
      @header.destroy
      head :no_content
    end

    private

    def header_params
      params.permit(:name, :table_id, header: [:type, :name])
    end

    def set_header
      @header = Header.find(params[:id])
    end
  end
end