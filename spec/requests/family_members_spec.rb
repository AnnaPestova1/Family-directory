require "rails_helper"
RSpec.describe "FamilyMembersControllers", type: :request do
  # Create the current_user before all examples have run
  before(:all) { @current_user = FactoryBot.create(:user) }

  # Destroy the current_user after all examples have run
  after(:all) do
    sign_out @current_user
    @current_user.destroy
  end

  describe "get family_members_path" do
    it "renders the index view" do
      # Sign in the user
      sign_in @current_user
      FactoryBot.create_list(:family_member, 10)
      get family_members_path
      expect(response).to render_template(:index)
    end
  end
  describe "GET /family_members/:id" do
    it "renders the :show template" do
      sign_in @current_user
      family_member = FactoryBot.create(:family_member, user: @current_user)
      get family_members_path(family_member)
      # puts "Response body: #{response.body.inspect}"
      expect(response).to render_template("family_members/index")
    end
  end
  describe "get new_family_member_path" do
    it "renders the :new template" do
      sign_in @current_user
      family_member = FactoryBot.create(:family_member, user: @current_user)
      get new_family_member_path(family_member)
      expect(response).to render_template(:new)
    end
  end
  describe "get edit_family_member_path" do
    it "renders the :edit template" do
      sign_in @current_user
      family_member = FactoryBot.create(:family_member, user: @current_user)
      get edit_family_member_path(family_member)
      expect(response).to render_template(:edit)
    end
  end
end
