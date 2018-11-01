class Card < ApplicationRecord
  belongs_to :account
  belongs_to :bank
  has_one :client
  has_one :transection
  validates :card_type, presence: true, length: {maximum: 10}, inclusion: { in: %w(credit debit)}
  validates :number, presence: true,length: {maximum: 15}
  validates :pin, presence: true, length: {is: 4}, numericality: {only_integer: true}
  validates :limit, presence: true, length: {maximum: 10}, numericality: true
  validates :account_id, :bank_id, presence: true
  validate :check_pin_validity
  after_initialize :generate_pin
  private
    def generate_pin
      self.pin = (rand() * 10000).to_i
    end
    def check_pin_validity
      unless (self.pin).to_s.size == 4
        errors.add("pin creation failed")
      end
    end
end
