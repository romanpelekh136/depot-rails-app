require 'rails_helper'

RSpec.describe "Store", type: :request do
  let(:user) { create(:user, password: "password") }

  before do
    login_as(user)
  end
  describe "GET /index" do
    it "returns http success" do
      create(:product)

      get store_index_path
      expect(response).to have_http_status(:success)

      expect(response.body).to include("Home")
      expect(response.body).to include("Contact")

      expect(response.body).to match(/\$[,\d]+\.\d\d/)
    end
  end
end
