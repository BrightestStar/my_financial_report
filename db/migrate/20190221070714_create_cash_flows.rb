class CreateCashFlows < ActiveRecord::Migration[5.1]
  def change
    create_table :cash_flows do |t|
      t.string :item
      t.float :money

      t.timestamps
    end
  end
end
