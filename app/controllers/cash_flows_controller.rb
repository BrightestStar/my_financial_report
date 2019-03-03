class CashFlowsController < ApplicationController
  before_action :find_item, only: %i[destroy]

  def create
    @cash_flow = current_user.cash_flows.create!(param_cash_flow)
    redirect_to dashboard_path
  end

  def destroy
    @cash_flow.destroy
    redirect_to dashboard_path
  end

  private

  def find_item
    @cash_flow = CashFlow.find(params[:id])
  end

  def param_cash_flow
    params.require(:cash_flow).permit(:subject, :income_expenses)
  end
end
