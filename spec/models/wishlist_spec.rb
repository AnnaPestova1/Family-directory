require "rails_helper"

RSpec.describe FamilyMember, type: :model do
  # Create the current_user before all examples have run
  before(:all) do
    @current_user = FactoryBot.create(:user)
    @family_member = FactoryBot.create(:family_member, user: @current_user)
  end
  # Destroy the current_user after all examples have run
  after(:all) do
    @current_user.destroy
    @family_member.destroy
  end

  it "create new item in wishlist" do
    wishlist = FactoryBot.create(:wishlist, family_member: @family_member)
    expect(wishlist).to be_valid
  end

  it "database save default quantity for items in wishlist = 1" do
    wishlist =
      Wishlist.create(
        description: "Test",
        link: "www.test.com",
        family_member: @family_member
      )
    expect(wishlist.quantity).to eq(1)
  end
  it "is not valid with empty description" do
    wishlist =
      Wishlist.create(
        description: "",
        link: "www.test.com",
        family_member: @family_member
      )
    expect(wishlist).to_not be_valid
  end
end
