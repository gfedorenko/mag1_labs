class Database < ApplicationRecord
  has_many :tables, :dependent => :destroy

  validates :name, presence: true,
            length: { minimum: 5 }
end
