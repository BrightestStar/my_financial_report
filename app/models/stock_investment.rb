class StockInvestment < ApplicationRecord
  has_many :cash_flows
  belongs_to :user
end
