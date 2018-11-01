require 'rails_helper'

RSpec.describe Card, type: :model do
  it "has a vaild card" do
    expect(FactoryBot.build(:card)).to be_valid
  end
# positive test cases
  it "has a valid bank_id-integer" do
    bank = FactoryBot.create(:bank)
    expect(FactoryBot.build(:card, bank_id: bank.id)).to be_valid
  end
  it "has a valid account_id-integer" do
    account = FactoryBot.create(:account)
    expect(FactoryBot.build(:card, account_id: account.id)).to be_valid
  end
  it "has a valid card_type-string-->credit" do
    expect(FactoryBot.build(:card, card_type: "credit")).to be_valid
  end
  it "has a valid number-->string" do
    expect(FactoryBot.build(:card, number: "7946595155")).to be_valid
  end
  it "has a valid pin-->integer" do
    expect(FactoryBot.build(:card, pin: 1234)).to be_valid
  end
  it "has a valid limit --> integer" do
    expect(FactoryBot.build(:card, limit: 454616.0)).to be_valid
  end
# negetive test cases
end
