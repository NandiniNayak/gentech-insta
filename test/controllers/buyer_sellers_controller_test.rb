require 'test_helper'

class BuyerSellersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @buyer_seller = buyer_sellers(:one)
  end

  test "should get index" do
    get buyer_sellers_url
    assert_response :success
  end

  test "should get new" do
    get new_buyer_seller_url
    assert_response :success
  end

  test "should create buyer_seller" do
    assert_difference('BuyerSeller.count') do
      post buyer_sellers_url, params: { buyer_seller: { seller_id: @buyer_seller.seller_id, user_id: @buyer_seller.user_id } }
    end

    assert_redirected_to buyer_seller_url(BuyerSeller.last)
  end

  test "should show buyer_seller" do
    get buyer_seller_url(@buyer_seller)
    assert_response :success
  end

  test "should get edit" do
    get edit_buyer_seller_url(@buyer_seller)
    assert_response :success
  end

  test "should update buyer_seller" do
    patch buyer_seller_url(@buyer_seller), params: { buyer_seller: { seller_id: @buyer_seller.seller_id, user_id: @buyer_seller.user_id } }
    assert_redirected_to buyer_seller_url(@buyer_seller)
  end

  test "should destroy buyer_seller" do
    assert_difference('BuyerSeller.count', -1) do
      delete buyer_seller_url(@buyer_seller)
    end

    assert_redirected_to buyer_sellers_url
  end
end
