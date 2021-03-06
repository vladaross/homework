class CreateAccountTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :account_transactions do |t|
      t.string :transaction_number
      t.decimal :amount
      t.string :transaction_type
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
