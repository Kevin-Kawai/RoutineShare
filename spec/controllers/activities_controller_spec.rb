require 'rails_helper'

RSpec.describe ActivitiesController, type: :controller do
  describe "activities#new" do 

    it "should allow a logged in user to view the new page" do
      routine = FactoryGirl.create(:routine)
      sign_in routine.user

      get :new, params: {routine_id: routine.id}
      expect(response).to have_http_status(:success)
    end

    it "should redirect to new_user_page if user is not logged in" do
      routine = FactoryGirl.create(:routine)
      get :new, params: { routine_id: routine.id }

      expect(response).to redirect_to new_user_session_path
    end

    it "shouldn't let someone who is logged in but doesn't own the routine add activities" do
      routine = FactoryGirl.create(:routine)
      user = FactoryGirl.create(:user)
      sign_in user

      get :new, params: {routine_id: routine.id}
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe "activities#create" do

    it "should allow a user who owns the routine to create a new activity" do 
      routine = FactoryGirl.create(:routine)
      sign_in routine.user
      post :create, params: {routine_id: routine.id,  activity: {name: "Success", description: "For awesome people" } }

      activity = Activity.last
      expect(activity.name).to eq("Success")
    end
  end

  describe "activities#update" do
    it "should update activities in the database" do
      activity = FactoryGirl.create(:activity)
      put :update, params: { id: activity.id, routine_id: activity.routine_id, activity: { name: "Changed Activity" } }

      expect(response).to have_http_status(:success)
      activity.reload
      expect(activity.name).to eq("Changed Activity")
    end
  end

  describe "activities#destroy" do
    it "should allow a user who owns the routine to delete a activity" do 
      routine = FactoryGirl.create(:routine)
      activity = FactoryGirl.create(:activity, routine_id: routine.id)
      sign_in activity.routine.user

      delete :destroy, params: {routine_id: activity.routine.id,id: activity.id}
      expect(routine.activities.length).to eq(0)
    end
  end
end
