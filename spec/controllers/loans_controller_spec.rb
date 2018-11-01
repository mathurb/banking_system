require 'rails_helper'

RSpec.describe LoansController, type: :controller do
  it "shows complete list of users" do
    lnOne = FactoryBot.create(:loan)
    lnTwo = FactoryBot.create(:loan)
    get :index
    expect(assigns(:loans)).to include lnOne
    expect(assigns(:loans)).to include lnTwo
    expect(response).to have_http_status(:ok)
  end
  it "has new data" do
    get :new
    expect(response).to have_http_status(:ok)
  end

end
