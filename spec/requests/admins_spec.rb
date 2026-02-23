require 'rails_helper'

RSpec.describe "Admins", type: :request do
  let(:admin) { create(:user) }

  describe "GET /admins" do
    it "should get index if logged in as admin" do
      login_as(admin)
      get admin_url
      expect(response).to be_successful
    end

    it "should be redirected if not logged in" do
      get admin_url
      expect(response).to redirect_to(new_session_url)
    end
  end
end
