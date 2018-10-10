class Transection < ApplicationRecord
    belongs_to :account
    has_one :card
    validates :txn_type, presence: true, length: {is: 1}, inclusion: { in: %w(W D)}
    validates :amount, presence: true,length: {maximum: 10}, numericality: true
    validates :account_id, presence: true
    validate :withdrawl_validity
    after_save :amount_update
   
    private
     def withdrawl_validity
        if self.txn_type == "W"
         if self.card.limit>self.amount   
           if self.amount > self.account.balance
             errors.add(:amount, "should be less than available balance")
           end 
          else
           errors.add(:amount,"excceds daily limit")
         end 
        end
     end 
         
     def amount_update
      if self.txn_type == "W"
           new_amount = self.account.amount - self.amount
      else
         new_amount = self.account.amount + self.amount
     end
     
     unless self.account.update_attributes(amount: new_amount)
        raise "Transaction Incomplete"
     end 
    end
end