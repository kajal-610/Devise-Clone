require "test_helper"

class ProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get edit_profile" do
    get profile_edit_profile_url
    assert_response :success
  end
end
