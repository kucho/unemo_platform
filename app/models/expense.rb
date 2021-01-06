class Expense < ApplicationRecord
  belongs_to :payee
  belongs_to :board
  belongs_to :category
  belongs_to :currency
end
