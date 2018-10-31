require 'rails_helper'

RSpec.describe Account, type: :model do
  it "has a valid factory instance" do
    expect(FactoryBot.build(:account)).to be_valid
  end

end
