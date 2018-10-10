class Client < ApplicationRecord
    belongs_to :branch
    has_many :accounts
    has_many :loans
    has_many :cards
    validates :number, presence: true , length: {maximum: 10}
    validates :age, presence: true , numericality:{only_integer: true} , length: {maximum: 3}
    validates :name, presence: true, length: {maximum: 10}
    validates :branch_id, presence: true
    validate :minimum_age
    private
    def minimum_age
      if self.age<0
        errors.add(:age, "seems like the person doesn't exist")
      end
    end
end