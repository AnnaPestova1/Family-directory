require "rails_helper"

RSpec.describe FamilyMember, type: :model do
  # Create the current_user and family_member before all examples have run
  before(:all) do
    @current_user = FactoryBot.create(:user)
    @family_member = FactoryBot.create(:family_member, user: @current_user)
  end
  # Destroy the current_user and family_member after all examples have run
  after(:all) do
    @current_user.destroy
    @family_member.destroy
  end

  it "create new contact" do
    contact = FactoryBot.create(:contact)
    contact.family_members << @family_member
    expect(contact).to be_valid
  end

  it "is not valid with empty name" do
    contact = Contact.create(name: "", phone: "1234567890", category: "test")
    contact.family_members << @family_member
    # puts contact.errors.full_messages
    expect(contact).to_not be_valid
  end
end
