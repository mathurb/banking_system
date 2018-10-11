class Loan < ApplicationRecord
  belongs_to :client
  belongs_to :branch
  validates :loan_type, presence: true, length: {maximum: 10}
  validates :amount, presence: true, length: {maximum: 10}, numericality: true
  validates :client_id, :branch_id, presence: true
  validate :minimum_loan_amount
  private
    def minimum_loan_amount
      if self.amount<1.0
        errors.add(:amount, "We only provide loans with some amount")
      end
    end
end