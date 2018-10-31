FactoryBot.define do
  factory :account do
    client_id {FactoryBot.create(:client).id}
    branch_id {FactoryBot.create(:branch).id}
    ifsc {FactoryBot.create(:branch).ifsc}
    amount {Faker::Number.decimal(11,3)}
    ac_number {Faker::Bank.account_number(17)}
    ac_type {"savings"}
  end
end
# todo: add factory associations associate it to factory client and branch
