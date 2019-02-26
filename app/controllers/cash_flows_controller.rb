class CashFlowsController < ApplicationController
  def create
    @cash_flow = current_user.cash_flows.create!(param_cash_flow)
  end

  private

  def param_cash_flow
    params.require(:cash_flow).permit(:subject, :income_expenses)
  end
end
