class Investment < ApplicationRecord
  has_one :cash_flow, dependent: :destroy
  belongs_to :user
end
