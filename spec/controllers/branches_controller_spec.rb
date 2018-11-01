require 'rails_helper'

RSpec.describe BranchesController, type: :controller do
  it "shows complete list of users" do
    brOne = FactoryBot.create(:branch)
    brTwo = FactoryBot.create(:branch)
    get :index
    expect(assigns(:branches)).to include brOne
    expect(assigns(:branches)).to include brTwo
    expect(response).to have_http_status(:ok)
  end
  it "has new data" do
    get :new
    expect(response).to have_http_status(:ok)
  end

end
