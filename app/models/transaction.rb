class Transaction < ApplicationRecord
  belongs_to :account

  after_create :apply_transaction

  def apply_transaction
    balance = get_new_balance
    account.update(balance: balance)
  end

  def get_new_balance
    case instruction
    when 'deposito'
      account.balance + amount
    when 'retiro'
      account.balance - amount
    end
  end
end
