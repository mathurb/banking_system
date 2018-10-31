class Bank < ApplicationRecord
  has_many :branches, dependent: :destroy
  has_many :accounts, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :number, presence: true, length: {maximum: 10}
end
#add uniqueindex to name, address, number
