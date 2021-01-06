class BoardIncomeSource < ApplicationRecord
  belongs_to :income_source
  belongs_to :board
end
