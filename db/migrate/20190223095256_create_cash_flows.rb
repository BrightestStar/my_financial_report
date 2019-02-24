class CreateCashFlows < ActiveRecord::Migration[5.1]
  def change
    create_table :cash_flows do |t|
      t.string :subject
      t.float :income_expenses
      t.integer :investment_id
      t.integer :stock_investment_id
      t.integer :user_id

      t.timestamps
    end
  end
end
