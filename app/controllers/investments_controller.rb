class InvestmentsController < ApplicationController
  before_action :find_item, only: %i[destroy update]

  def create
    @invest = current_user.investments.create!(param_investment)
    subject = @invest.subject
    amount = params[:income_expenses].to_i
    return unless amount

    @cash_flow = current_user.cash_flows.create!(subject: subject,
                                                  income_expenses: amount,
                                                  investment_id: @invest.id)

    redirect_to dashboard_path
  end

  def update
    account_items = params["account_items"].values
    update_arg = account_items.reduce({}, :merge)
    @invest.update(update_arg)
    redirect_to dashboard_path
  end

  def destroy
    @invest.destroy

    redirect_to dashboard_path
  end

  private

  def find_item
    @invest = Investment.find(params[:id])
  end

  def param_investment
    params.require(:investment).permit(:subject, :down_payment, :cost, :debt)
  end
end
