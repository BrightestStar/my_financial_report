Test_datas_income = CashFlow.where("income_expenses >= 0")
Test_datas_outlay = CashFlow.where("income_expenses < 0")
Test_datas_invest = Investment.all
Test_datas_stock = StockInvestment.all
