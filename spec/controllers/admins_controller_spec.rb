require 'rails_helper'

RSpec.describe AdminsController, type: :controller do

  describe "GET #edit_users" do
    it "returns http success" do
      get :edit_users
      expect(response).to have_http_status(:success)
    end
  end

end
