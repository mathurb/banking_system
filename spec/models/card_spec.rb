require 'rails_helper'

RSpec.describe Card, type: :model do
  it "has a vaild card" do
    expect(FactoryBot.build(:card)).to be_valid
  end
end
