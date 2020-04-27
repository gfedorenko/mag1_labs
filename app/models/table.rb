class Table < ApplicationRecord
  has_one :header, :dependent => :destroy
  has_many :rows, :dependent => :destroy
  belongs_to :database

  validates :name, presence: true,
            length: { minimum: 5 }

  def self.create_with_header(params)
    header = params.delete(:header)
    @table = Table.create!(params)
    @header = Header.create!(table_id: @table.id)
    header.each do |field|
      field[:header_id] = @header.id
      Field.create(field)
    end
    @table
  end
end
