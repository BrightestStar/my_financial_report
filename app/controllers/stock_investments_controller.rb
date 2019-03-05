class StockInvestmentsController < ApplicationController
  before_action :find_item, only: %i[destroy update]

  def create
    @stock = current_user.stock_investments.create!(param_stock)
    subject = "股基编码(" + @stock.coding.to_s + ")"
    amount = params[:income_expenses].to_i
    return unless amount

    @cash_flow = current_user.cash_flows.create!(subject: subject,
                                                 income_expenses: amount,
                                                 stock_investment_id: @stock.id)

    redirect_to dashboard_path
  end

  def update
    account_items = params["account_items"].values
    update_arg = account_items.reduce({}, :merge)
    @stock.update(update_arg)
    redirect_to dashboard_path
  end

  def destroy
    @stock.destroy
    redirect_to dashboard_path
  end

  private

  def find_item
    @stock = StockInvestment.find(params[:id])
  end

  def param_stock
    params.require(:stock_investment).permit(:coding, :amount, :price, :debt)
  end
end
