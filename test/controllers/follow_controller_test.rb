require 'test_helper'

class FollowControllerTest < ActionDispatch::IntegrationTest
  test "should get page" do
    get follow_page_url
    assert_response :success
  end

end
