require 'rails_helper'

RSpec.describe CardsController, type: :controller do
  it "shows complete list of users" do
    cdOne = FactoryBot.create(:card)
    cdTwo = FactoryBot.create(:card)
    get :index
    expect(assigns(:cards)).to include cdOne
    expect(assigns(:cards)).to include cdTwo
    expect(response).to have_http_status(:ok)
  end
  it "has new data" do
    get :new
    expect(response).to have_http_status(:ok)
  end

end
