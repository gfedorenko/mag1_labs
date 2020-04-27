class Row < ApplicationRecord
  belongs_to :table
  has_many :cells, :dependent => :destroy

  def self.create_cells(params)
    @row = Row.create!(table_id: params[:table_id])
    header = Table.find(params[:table_id]).header.id
    params[:values].each do |cell|
      Cell.create!(
        value: cell[:value],
        row_id: @row.id,
        field_id: Field.find_by(name: cell[:field_name], header_id: header).id
      )
    end
    @row
  end
end
