class Client < ApplicationRecord
    belongs_to :branch
    has_many :accounts
    has_many :loans
    validates :number, presence: true , numericality:{only_integer: true} , length: {maximum: 10}
    validates :age, presence: true , numericality:{only_integer: true} , length: {maximum: 3}
    validates :name, presence: true, length: {maximum: 10}
    validate :minimum_age
    private
    def minimum_age
      if self.age<0
        errors.add(:age, "seems like the person doesn't exist")
      end
    end
end