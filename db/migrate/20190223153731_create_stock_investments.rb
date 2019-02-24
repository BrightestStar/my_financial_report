class CreateStockInvestments < ActiveRecord::Migration[5.1]
  def change
    create_table :stock_investments do |t|
      t.string :coding
      t.integer :amount
      t.float :price
      t.integer :user_id

      t.timestamps
    end
  end
end
