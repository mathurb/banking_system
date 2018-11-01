FactoryBot.define do
  factory :bank do
    name {Faker::Bank.name}
    address {Faker::Address.full_address}
    number {Faker::Bank.routing_number}
  end
end
