class Transection < ApplicationRecord
  belongs_to :account
  belongs_to :card
  validates :txn_type, presence: true, length: {is: 1}, inclusion: { in: %w(W D)}
  validates :amount, presence: true,length: {maximum: 10}, numericality: true
  validates :account_id, presence: true
  validate :withdrawl_validity
  after_save :amount_update
  private
    def withdrawl_validity
      card = Card.find(self.card_id)
      account = Account.find(self.account_id)
      if self.txn_type == "W"
        if card.limit>self.amount
          if self.amount > account.amount
            errors.add(:amount, "should be less than available amount")
          end
        else
          errors.add(:amount,"excceds daily limit")
        end
      end
    end
    def amount_update
      account = Account.find(self.account_id)
      if self.txn_type == "W"
        new_amount = account.amount - self.amount
      else
        new_amount = account.amount + self.amount
      end
      unless account.update_attributes(amount: new_amount)
        raise "Transaction Incomplete"
      end
    end
end
