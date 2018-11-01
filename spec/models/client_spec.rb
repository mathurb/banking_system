require 'rails_helper'

RSpec.describe Client, type: :model do
  it "has a vaild client" do
    expect(FactoryBot.build(:client)).to be_valid
  end
# positive test cases
  it "has a valid branch_id-->integer" do
    branch = FactoryBot.create(:branch)
    expect(FactoryBot.build(:client, branch_id: branch.id)).to be_valid
  end
  it "has a valid number --> string" do
    expect(FactoryBot.build(:client, number: "456464564")).to be_valid
  end
  it "has a valid age -- > int" do
    expect(FactoryBot.build(:client, age: 45)).to be_valid
  end
  it "has a valid name --> string" do
    expect(FactoryBot.build(:client, name: "not integer name")).to be_valid
  end
# negetive test cases
end
