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
   describe "post family_member with valid data" do
    it "saves a new entry and redirects to the index page" do
      sign_in @current_user
      family_member_attributes = FactoryBot.attributes_for(:family_member, user: @current_user)
      expect {
        post family_members_path, params: { family_member: family_member_attributes }
      }.to change(FamilyMember, :count).by(1)
      expect(response).to redirect_to(family_members_url)
    end
  end
  describe "post family_member with invalid data" do
    it "does not save a new entry or redirect" do
      sign_in @current_user
      family_member_attributes = FactoryBot.attributes_for(:family_member, user: @current_user)
      family_member_attributes.delete(:first_name)
      expect { post family_members_path, params: {family_member: family_member_attributes}
    }.to_not change(FamilyMember, :count)
      expect(response).to render_template(:new)
    end
  end
   describe "put family_member with valid data" do
    it "updates an entry and redirects to the family_members" do
      sign_in @current_user
      family_member = FactoryBot.create(:family_member, user: @current_user)   
      put family_member_path(family_member.id), params: {family_member: {first_name: "Valid Name"}}                 
      family_member.reload
      expect(family_member.first_name).to eq("Valid Name")
      expect(response).to redirect_to(family_members_url)
    end
  end
  describe "put family_member with invalid data" do
    it "does not update the family_member" do
      sign_in @current_user
      family_member = FactoryBot.create(:family_member, user: @current_user)   
      put family_member_path(family_member.id), params: {family_member: {first_name: "@"}} 
      family_member.reload
      expect(family_member.first_name).not_to eq("@")
      expect(response).to render_template(:edit) 
    end
  end
   describe "delete the family_member record" do
    it "deletes the family_member record" do
      sign_in @current_user
      family_member = FactoryBot.create(:family_member, user: @current_user)   
       expect { delete  family_member_path(family_member.id)
    }.to change(FamilyMember, :count)
      expect(response).to redirect_to family_members_url
    end
  end
end
