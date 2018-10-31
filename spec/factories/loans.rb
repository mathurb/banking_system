FactoryBot.define do
  factory :loan do
    branch_id { FactoryBot.create(:branch).id }
    client_id { FactoryBot.create(:client).id }
    loan_type { Faker::Lorem.word }
    amount { Faker::Number.decimal(7, 2).to_f }
  end
end
