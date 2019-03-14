class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cash_flows, dependent: :destroy
  has_many :investments, dependent: :destroy
  has_many :stock_investments, dependent: :destroy

  has_many :comments

  before_save :verify_user_name

  def verify_user_name
    self.name = nil if name == '作者'
  end
end
