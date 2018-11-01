require 'rails_helper'

RSpec.describe Account, type: :model do
  it "has a valid factory instance" do
    expect(FactoryBot.build(:account)).to be_valid
  end
# valid test cases
  it "has a valid client id" do
    testClient = FactoryBot.create(:client)
    expect(FactoryBot.build(:account, client_id: testClient.id)).to be_valid
  end
  it "has a valid branch_id" do
    testBranch = FactoryBot.create(:branch)
    expect(FactoryBot.build(:account, branch_id: testBranch.id)).to be_valid
  end
  it "has a valid ifsc" do
    testBranch = FactoryBot.create(:branch)
    expect(FactoryBot.build(:account, ifsc: testBranch.ifsc)).to be_valid
  end
  it "has a valid amount" do
    expect(FactoryBot.build(:account, amount: 4658.12)).to be_valid
  end
  it "has a valid account_number" do
    expect(FactoryBot.build(:account, ac_number: 79874651)).to be_valid
  end
  it "has a valid ac_type - savings" do
    expect(FactoryBot.build(:account, ac_type: "savings")).to be_valid
  end
  it "has a valid ac_type - current" do
    expect(FactoryBot.build(:account, ac_type: "current")).to be_valid
  end
# invalid test cases
end
