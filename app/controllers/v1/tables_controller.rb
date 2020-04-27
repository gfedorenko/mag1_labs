module V1
  class TablesController < ApplicationController
    before_action :set_table, only: [:show, :update, :destroy]

    def index
      @tables = Table.where(database_id: params[:database_id]).paginate(page: params[:page], per_page: 20)
      render json: @tables
    end

    def show
      json_response(@table)
    end

    def create
      @table = Table.create_with_header(table_params)
      json_response(@table, :created)
    end

    def update
      @table.update(table_params)
      head :no_content
    end

    def destroy
      @table.destroy
      head :no_content
    end

    def intersection
      first_table = Table.find(intersection_params[:first_table_id])
      second_table = Table.find(intersection_params[:second_table_id])
      first_header = first_table.header.fields.map { |f| f.slice(:field_type, :name) }
      second_header = second_table.header.fields.map { |f| f.slice(:field_type, :name) }
      return render [] unless check_headers(first_header, second_header)

      first_rows = []
      second_rows = []
      result = []

      first_table.rows.each do |row|
        hash_row = []
        row.cells.each do |cell|
          pp cell
          hash_row << {field_type: cell.field.field_type, name: cell.field.name, value: cell.value}
        end
        first_rows << hash_row
      end

      second_table.rows.each do |row|
        hash_row = []
        row.cells.each do |cell|
          hash_row << {field_type: cell.field.field_type, name: cell.field.name, value: cell.value}
        end
        second_rows << hash_row
      end

      first_rows.each do |first|
        second_rows.each do |second|
          result << first if first == second
        end
      end
      render json: result
    end

    private

    def check_headers(first, second)
      return true if first == second
      false
    end

    def table_params
      params.permit(:name, :database_id, header: [:type, :name])
    end

    def intersection_params
      params.permit(:first_table_id, :second_table_id)
    end

    def set_table
      @table = Table.find(params[:id])
    end
  end
end