require 'test_helper'

class WorkingControllerTest < ActionDispatch::IntegrationTest
  test "should get page" do
    get working_page_url
    assert_response :success
  end

end
