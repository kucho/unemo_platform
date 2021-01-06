class Category < ApplicationRecord
  belongs_to :board
  belongs_to :parent
end
