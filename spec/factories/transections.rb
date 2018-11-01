FactoryBot.define do
  factory :transection do
    account_id { FactoryBot.create(:account).id }
    card_id { FactoryBot.create(:card).id }
    amount { Faker::Number.decimal(7, 2) }
    txn_type { 'W' }
  end
end
