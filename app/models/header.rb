class Header < ApplicationRecord
  belongs_to :table
  has_many :fields, :dependent => :destroy
end
