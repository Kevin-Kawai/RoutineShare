require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User" do
    it "should create a user" do
      user = FactoryGirl.create(:user)
      expect(user.email).to match(/dummyemail[0-9]*\@gmail\.com/)
    end
  end
end
