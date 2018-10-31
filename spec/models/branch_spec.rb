require 'rails_helper'

RSpec.describe Branch, type: :model do
  it "has a vaild branch" do
    expect(FactoryBot.build(:branch)).to be_valid
  end
end
