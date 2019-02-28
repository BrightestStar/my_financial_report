class StockInvestmentsController < ApplicationController
  def create
    @stock = current_user.stock_investments.create!(param_stock)
    subject = "股基编码(" + @stock.coding.to_s + ")"
    amount = params[:income_expenses].to_i
    return unless amount

    @cash_flow = current_user.cash_flows.create!(subject: subject,
                                                 income_expenses: amount,
                                                 stock_investment_id: @stock.id)
  end

  private

  def param_stock
    params.require(:stock_investment).permit(:coding, :amount, :price, :debt)
  end
end
