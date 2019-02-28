class InvestmentsController < ApplicationController
  def create
    @invest = current_user.investments.create!(param_investment)
    subject = @invest.subject
    amount = params[:income_expenses].to_i
    return unless amount

    @cash_flow = current_user.cash_flows.create!(subject: subject,
                                                  income_expenses: amount,
                                                  investment_id: @invest.id)
  end

  private

  def param_investment
    params.require(:investment).permit(:subject, :down_payment, :cost, :debt)
  end
end
