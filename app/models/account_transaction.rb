class AccountTransaction < ApplicationRecord
  belongs_to :account

  TRANSACTION_TYPES = ["withdraw", "deposit"]


end
