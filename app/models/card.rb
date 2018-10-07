class Card < ApplicationRecord
    belongs_to :account
    validates :card_type, presence: true, length: {maximum: 10}, inclusion: { in: %w(credit debit)}
    validates :number, presence: true,length: {maximum: 15}
    validates :pin, presence: true, length: {is: 4}
    validates :limit, presence: true, length: {maximum: 8}
   end