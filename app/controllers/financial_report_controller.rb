class FinancialReportController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @incomes = current_user.cash_flows.where("income_expenses > 0")
  end
end
