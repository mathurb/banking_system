require 'rails_helper'

RSpec.describe Bank, type: :model do
  it "is valid bank" do
    expect(FactoryBot.build(:bank)).to be_valid
  end
# positive test cases
  it "has a valid name" do
    expect(FactoryBot.build(:bank, name: "national bank of testing")).to be_valid
  end
  it "has a valid address" do
    expect(FactoryBot.build(:bank, address: "123,test street, test locality")).to be_valid
  end
  it "has a valid number- string type" do
    expect(FactoryBot.build(:bank, number: "78946564")).to be_valid
# negetive test cases    
  end
end
