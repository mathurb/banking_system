require 'rails_helper'

RSpec.describe BanksController, type: :controller do
  it "shows complete list of users" do
    bOne = FactoryBot.create(:bank)
    bTwo = FactoryBot.create(:bank)
    get :index
    expect(assigns(:banks)).to include bOne
    expect(assigns(:banks)).to include bTwo
    expect(response).to have_http_status(:ok)
  end
  it "has new data" do
    get :new
    expect(response).to have_http_status(:ok)
  end

end
