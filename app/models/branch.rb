class Branch < ApplicationRecord
    belongs_to :bank
    has_many :clients
    validates :ifsc, presence: true, length: {maximum: 10}
    validates :address, presence: true, length: {maximum: 15}
    validates :number, presence: true, length: {maximum: 10}
    validates :bank_id, presence: true
   end