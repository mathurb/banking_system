class Account < ApplicationRecord
  belongs_to :client
  belongs_to :branch
  has_many :transactions, dependent: :destroy
  has_one :card
  has_one :bank
  has_one :transection, through: :card
  validates :amount, presence: true, length: {maximum: 15}, numericality: true
  validates :ac_type, presence: true, length: {maximum: 15},inclusion: { in: %w(savings current)}
  validates :ac_number, presence: true, length: {maximum: 17}
  validates :ifsc, presence: true, length: {maximum: 11}
  validates :client_id, :branch_id, presence: true
  validate :amount_validity
  before_create :put_ifsc
  private
    def amount_validity
      if self.amount.to_s < "0"
        errors.add(:amount, "amount must not be less the minimum threshold")
      end
    end
    def put_ifsc
      branch = Branch.find(self.branch_id)
      self.ifsc = branch.ifsc
    end
end
