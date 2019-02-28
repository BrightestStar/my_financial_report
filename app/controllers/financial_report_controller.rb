class FinancialReportController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @incomes = current_user.cash_flows.where("income_expenses >= 0")
    @expenses = current_user.cash_flows.where("income_expenses < 0")
    @investments = current_user.investments
    @stock_investments = current_user.stock_investments
  end
end
