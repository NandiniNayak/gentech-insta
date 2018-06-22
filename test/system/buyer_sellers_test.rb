require "application_system_test_case"

class BuyerSellersTest < ApplicationSystemTestCase
  setup do
    @buyer_seller = buyer_sellers(:one)
  end

  test "visiting the index" do
    visit buyer_sellers_url
    assert_selector "h1", text: "Buyer Sellers"
  end

  test "creating a Buyer seller" do
    visit buyer_sellers_url
    click_on "New Buyer Seller"

    fill_in "Seller", with: @buyer_seller.seller_id
    fill_in "User", with: @buyer_seller.user_id
    click_on "Create Buyer seller"

    assert_text "Buyer seller was successfully created"
    click_on "Back"
  end

  test "updating a Buyer seller" do
    visit buyer_sellers_url
    click_on "Edit", match: :first

    fill_in "Seller", with: @buyer_seller.seller_id
    fill_in "User", with: @buyer_seller.user_id
    click_on "Update Buyer seller"

    assert_text "Buyer seller was successfully updated"
    click_on "Back"
  end

  test "destroying a Buyer seller" do
    visit buyer_sellers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Buyer seller was successfully destroyed"
  end
end
