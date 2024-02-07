require "rails_helper"

RSpec.describe FamilyMember, type: :model do
  # Create the current_user before all examples have run
  before(:all) { @current_user = FactoryBot.create(:user) }

  # Destroy the current_user after all examples have run
  after(:all) { @current_user.destroy }

  it "is not valid with empty first name" do
    family_member =
      FamilyMember.new(
        first_name: "",
        relationship: "Son",
        user_id: @current_user.id
      )
    expect(family_member).to_not be_valid
  end

  it "is not valid without a relationship" do
    subject.relationship = nil
    expect(subject).to_not be_valid
  end

  it "is valid with valid attributes" do
    family_member = FactoryBot.create(:family_member, user: @current_user)
    expect(family_member).to be_valid
  end
end
