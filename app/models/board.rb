class Board < ApplicationRecord
  belongs_to :user_group
  belongs_to :currency
end
