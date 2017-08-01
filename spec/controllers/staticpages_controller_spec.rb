require 'rails_helper'

RSpec.describe StaticpagesController, type: :controller do
  describe "staticpages#index action" do
    it "should show the frontpage successfully" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
