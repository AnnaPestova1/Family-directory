require "application_system_test_case"

class WishlistsTest < ApplicationSystemTestCase
  setup do
    @wishlist = wishlists(:one)
  end

  test "visiting the index" do
    visit wishlists_url
    assert_selector "h1", text: "Wishlists"
  end

  test "should create wishlist" do
    visit wishlists_url
    click_on "New wishlist"

    fill_in "Description", with: @wishlist.description
    fill_in "Family member", with: @wishlist.family_member_id
    fill_in "Link", with: @wishlist.link
    check "Purchased" if @wishlist.purchased
    fill_in "Quantity", with: @wishlist.quantity
    click_on "Create Wishlist"

    assert_text "Wishlist was successfully created"
    click_on "Back"
  end

  test "should update Wishlist" do
    visit wishlist_url(@wishlist)
    click_on "Edit this wish", match: :first

    fill_in "Description", with: @wishlist.description
    fill_in "Family member", with: @wishlist.family_member_id
    fill_in "Link", with: @wishlist.link
    check "Purchased" if @wishlist.purchased
    fill_in "Quantity", with: @wishlist.quantity
    click_on "Update Wish"

    assert_text "Wishlist was successfully updated"
    click_on "Back"
  end

  test "should destroy Wishlist" do
    visit wishlist_url(@wishlist)
    click_on "Destroy this wish", match: :first

    assert_text "Wishlist was successfully destroyed"
  end
end
