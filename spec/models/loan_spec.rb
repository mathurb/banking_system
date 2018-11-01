require 'rails_helper'

RSpec.describe Loan, type: :model do
  it "has a vaild loan" do
    expect(FactoryBot.build(:loan)).to be_valid
  end
# positive test cases
  it "has a valid branch_id-> integer" do
    branch = FactoryBot.create(:branch)
    expect(FactoryBot.build(:loan, branch_id: branch.id)).to be_valid
  end
  it " has a valid client_id -- >integer" do
    client = FactoryBot.create(:client)
    expect(FactoryBot.build(:loan, client_id: client.id)).to be_valid
  end
  it "has a valid loan_type-->string" do
    expect(FactoryBot.build(:loan, loan_type: "hello_hello")).to be_valid
  end
  it "has a valid amount--> float" do
    expect(FactoryBot.build(:loan, amount: 452224.02)).to be_valid
  end
# -ve test cases
end
