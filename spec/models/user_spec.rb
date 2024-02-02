require "rails_helper"

RSpec.describe User, type: :model do
  describe "creation" do
    before { @user = FactoryBot.create(:user) }

    it "should be able to be created if valid" do
      expect(@user).to be_valid
    end
    describe "validations" do
      it "should not be valid without a first name" do
        @user.first_name = nil
        expect(@user).to_not be_valid
      end
      it "should not be valid without a last name" do
        @user.last_name = nil
        expect(@user).to_not be_valid
      end
    end
    after(:each) { @user.destroy }
  end
end
