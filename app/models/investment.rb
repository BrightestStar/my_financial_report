class Investment < ApplicationRecord
  has_many :cash_flows
  belongs_to :user
end
