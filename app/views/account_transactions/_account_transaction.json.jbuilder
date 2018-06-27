json.extract! account_transaction, :id, :transaction_number, :amount, :transaction_type, :account_id, :created_at, :updated_at
json.url account_transaction_url(account_transaction, format: :json)
