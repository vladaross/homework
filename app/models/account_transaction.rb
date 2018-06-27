class AccountTransaction < ApplicationRecord
  belongs_to :account

  TRANSACTION_TYPES = ["withdraw", "deposit"]


    def to_s
      account
    end

end
