FactoryBot.define do
  factory :client do
    branch_id {FactoryBot.create(:branch).id}
    number {Faker::Number.number(10)}
    age {Faker::Number.number(2)}
    name {Faker::Name.name}
  end
end
