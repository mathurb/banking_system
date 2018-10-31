require 'rails_helper'

RSpec.describe Transection, type: :model do
  it "has a vaild transection" do
    expect(FactoryBot.build(:transection)).to be_valid
  end
end
