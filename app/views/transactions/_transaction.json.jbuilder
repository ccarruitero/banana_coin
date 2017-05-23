json.extract! transaction, :id, :account_id, :description, :amount, :instruction, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
