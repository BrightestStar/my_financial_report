# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
count = 1
10.times do
  money = count * 100
  CashFlow.create(subject: "subject#{count}", income_expenses: money)
  count += 1
end

count = 1
10.times do
  money = -count * 100
  CashFlow.create(subject: "subject#{count}", income_expenses: money)
  count += 1
end

count = 1
10.times do
  money = count * 100
  inv = Investment.create(subject: "subject#{count}",
    down_payment: money * 10, cost: money * 100, debt: money * 700
  )
  inv.cash_flows.create(subject: inv.subject, income_expenses: -money * 0.7)
  count += 1
end

count = 1
10.times do
  money = count * 100
  inv = StockInvestment.create(coding: "subject#{count}",
    price: count * 10, amount: 100
  )
  inv.cash_flows.create(subject: inv.coding, income_expenses: 0)
  count += 1
end
