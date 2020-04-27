class TableSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  # attributes to be serialized
  attributes :id, :name, :created_at, :updated_at, :database_id,:links
  # model association
  has_many :rows
  has_one :header
  type :table
  def links
    [
      {
        rel: :self,
        href: database_table_path(Database.find(object.database_id), object)
      }
    ]
  end
end