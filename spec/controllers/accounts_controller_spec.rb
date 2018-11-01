require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  it "shows complete list of users" do
    aOne = FactoryBot.create(:account)
    aTwo = FactoryBot.create(:account)
    get :index
    expect(assigns(:accounts)).to include aOne
    expect(assigns(:accounts)).to include aTwo
    expect(response).to have_http_status(:ok)
  end
  it "has new data" do
    get :new
    expect(response).to have_http_status(:ok)
  end

end
