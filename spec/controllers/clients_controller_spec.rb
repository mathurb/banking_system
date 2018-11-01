require 'rails_helper'

RSpec.describe ClientsController, type: :controller do
  it "shows complete list of users" do
    clOne = FactoryBot.create(:client)
    clTwo = FactoryBot.create(:client)
    get :index
    expect(assigns(:clients)).to include clOne
    expect(assigns(:clients)).to include clTwo
    expect(response).to have_http_status(:ok)
  end
  it "has new data" do
    get :new
    expect(response).to have_http_status(:ok)
  end

end
