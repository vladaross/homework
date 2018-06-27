module Service
  class Withdraw

  def initialize(params)
    @account = account
    @amount_to_withdraw = amount_to_withdraw
    @amount = transaction_amount
  end

  def call
    if amount_to_withdraw <= @account.amount

      new_amount = @account.amount -= amount_to_withdraw
      @account.update!(amount: new_amount)

    end
  end

  def withdraw_transaction
    @account_transaction.type = 'Withdraw'
    @account_transaction.amount = amount_to_withdraw
    @account_transaction.user_id = @account.user_id
    @account_transaction.update!(type: 'Withdraw', amount: amount_to_withdraw,
      user_id = @account.user_id)
  end

  end
end
