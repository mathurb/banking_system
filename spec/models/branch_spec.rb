require 'rails_helper'

RSpec.describe Branch, type: :model do
  it "has a vaild branch" do
    expect(FactoryBot.build(:branch)).to be_valid
  end
# positive test cases
  it "has valid bank_id" do
    bank = FactoryBot.create(:bank)
    expect(FactoryBot.build(:branch, bank_id: bank.id)).to be_valid
  end
  it "has valid ifsc" do
    expect(FactoryBot.build(:branch, ifsc: "asda897")).to be_valid
  end
  it "has valid address - string" do
    expect(FactoryBot.build(:branch, address: "654,test branch, test location")).to be_valid
  end
  it "has valid number - string" do
    expect(FactoryBot.build(:branch, number: "8796542")).to be_valid
  end
# negetive test cases
end
