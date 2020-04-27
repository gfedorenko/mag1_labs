class Cell < ApplicationRecord
  belongs_to :field
  belongs_to :row
end
