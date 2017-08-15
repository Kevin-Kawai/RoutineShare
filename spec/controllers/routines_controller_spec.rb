require 'rails_helper'

RSpec.describe RoutinesController, type: :controller do
  describe "routines#index" do

    it "should allow user to view all routines" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "routines#show" do

    it "should show the routine detail page" do
      routine = FactoryGirl.create(:routine)
      get :show, params: { id: routine.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "routines#new" do

    it "should successfully show the page if logged in" do
      user = FactoryGirl.create(:user)
      sign_in user

      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "routines#create" do 

    it "should require the user to be logged in" do
      post :create, params: { routine: { name: "FAKE", description: "MORE FAKE" } }
      expect(response).to redirect_to new_user_session_path
    end

    it "should successfully add a routine" do
      user = FactoryGirl.create(:user)
      sign_in user

      post :create, params: { routine: {name: "Success", description: "You are successfull" } } 
      routine = Routine.last
      expect(response).to redirect_to routine_path(routine)

      expect(routine.name).to eq("Success")
      expect(routine.user).to eq(user)
    end
  end
end
