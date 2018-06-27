class AccountTransaction < ApplicationRecord
  belongs_to :account

  TRANSACTION_TYPES = ["withdraw", "deposit"]

    # validates :account, precense: true
    # validates :amount, precense: true, numericality: true
    # validates :transaction_type, precense: true, inclusion: { in: TRANSACTION_TYPES }
    # validates :transaction_number, precense: true, uniqueness: true
    #
    # before_validation :load_defaults

    def load_defaults
      if self.new_record?
        self.transaction_number = SecureRandom.uuid
      end
    end

    def to_s
      account
    end

end
