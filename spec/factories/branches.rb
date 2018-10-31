FactoryBot.define do
  factory :branch do
    bank_id {FactoryBot.create(:bank).id}
    ifsc {Faker::Bank.swift_bic}
    address {Faker::Address.full_address}
    number {Faker::Number.number(10)}
  end
end
