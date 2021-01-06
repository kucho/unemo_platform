class IncomeSource < ApplicationRecord
  belongs_to :income_type
  belongs_to :user
end
