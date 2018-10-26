require 'rails_helper'

RSpec.describe Bank, type: :model do

  it "is valid and works somehow" do
    expect(FactoryBot.build(:bank)).to be_valid
  end
end
