class CellSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  # attributes to be serialized
  attributes :id, :created_at, :updated_at, :value
  # model association
  type :cell

  # def links
  #   [
  #     {
  #       rel: :self,
  #       href: database_table_header_path(Database.find(Table.find(Header.find(object.header_id)).database_id), Table.find(Header.find(object.header_id)), Header.find(object.header_id),object)
  #     }
  #   ]
  # end
end