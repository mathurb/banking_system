require 'rails_helper'

RSpec.describe Transection, type: :model do
  it "has a vaild transection" do
    expect(FactoryBot.build(:transection)).to be_valid
  end
# +ve test cases
  it "has a valid account_id -->integer" do
    account = FactoryBot.create(:account)
    expect(FactoryBot.build(:transection, account_id: account.id)).to be_valid
  end
  it "has a valid card_id --> integer" do
    card = FactoryBot.create(:card)
    expect(FactoryBot.build(:transection, card_id: card.id)).to be_valid
  end
  it "has valid ammount --> numerical value" do
    expect(FactoryBot.build(:transection, amount: 456655.1)).to be_valid
  end
  it "has valid txn_type-W" do
    expect(FactoryBot.build(:transection, txn_type: "W")).to be_valid
  end
  it "has a valid txn_type-D" do
    expect(FactoryBot.build(:transection, txn_type: "D")).to be_valid
  end
# -ve test cases
end
