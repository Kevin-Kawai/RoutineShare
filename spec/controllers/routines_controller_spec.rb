require 'rails_helper'

RSpec.describe RoutinesController, type: :controller do
  describe "routines#index" do
    it "should allow user to view all routines" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
