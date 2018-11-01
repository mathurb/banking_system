FactoryBot.define do
  factory :card do
    bank_id { FactoryBot.create(:bank).id }
    account_id { FactoryBot.create(:account).id }
    card_type { 'debit' }
    number { Faker::Number.number(15) }
    pin { Faker::Number.number(4).to_i }
    limit { Faker::Number.number(8).to_f }
  end
end
