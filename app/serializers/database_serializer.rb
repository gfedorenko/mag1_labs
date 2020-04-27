class DatabaseSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  # attributes to be serialized
  attributes :id, :name, :created_at, :updated_at, :links
  # model association
  has_many :tables
  type :database

  def links
    [
      {
        rel: :self,
        href: database_path(object)
      }
    ]
  end
end
