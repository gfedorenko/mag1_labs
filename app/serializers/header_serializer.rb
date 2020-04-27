class HeaderSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  # attributes to be serialized
  attributes :id, :created_at, :updated_at, :links
  # model association
  has_many :fields
  type :header

  def links
    [
      {
        rel: :self,
        href: database_table_header_path(Database.find(Table.find(object.table_id).database_id), Table.find(object.table_id), object)
      }
    ]
  end
end