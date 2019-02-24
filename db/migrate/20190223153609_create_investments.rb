class CreateInvestments < ActiveRecord::Migration[5.1]
  def change
    create_table :investments do |t|
      t.string :subject
      t.integer :down_payment
      t.integer :cost
      t.integer :debt
      t.integer :user_id

      t.timestamps
    end
  end
end
