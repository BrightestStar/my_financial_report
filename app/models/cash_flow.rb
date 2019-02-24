class CashFlow < ApplicationRecord
  belongs_to :investment, optional: true
  belongs_to :stock_investment, optional: true
  belongs_to :user
end
