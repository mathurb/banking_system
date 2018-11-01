require 'rails_helper'

RSpec.describe TransectionsController, type: :controller do
  it "shows complete list of users" do
    trOne = FactoryBot.create(:account)
    trTwo = FactoryBot.create(:account)
    get :index
    expect(assigns(:transections)).to include trOne
    expect(assigns(:transections)).to include trTwo
    expect(response).to have_http_status(:ok)
  end
  it "has new data" do
    get :new
    expect(response).to have_http_status(:ok)
  end

end
