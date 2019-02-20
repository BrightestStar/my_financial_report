class FinancialReportController < ApplicationController
  before_action :authenticate_user!

  def dashboard; end
end
