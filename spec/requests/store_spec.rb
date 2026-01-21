require 'rails_helper'

RSpec.describe "Stores", type: :request do
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
