module Service
  class Deposit

    def initialize(params)
      @account = account
      @amount_to_deposit = amount_to_deposit
      @account_transaction = account_transaction
    end

    def call

      new_amount = @account.amount += amount_to_deposit
      @account.update!(amount: new_amount)

    end

    def deposit_transaction
      @account_transaction.type = 'Deposit'
      @account_transaction.amount = amount_to_deposit
      @account_transaction.user_id = @account.user_id
      @account_transaction.update!(type: 'Deposit', amount: amount_to_deposit,
        user_id = @account.user_id)
    end

  end
end
