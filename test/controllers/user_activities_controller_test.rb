require "test_helper"

class UserActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    # This matches the Rails 8 'Authentication' system requirements
    post session_url, params: { email_address: @user.email_address, password: "password" }
    
    @activity = user_activities(:one)
  end

  test "should get index" do
    get user_activities_url
    assert_response :success
    # Check that the controller variable is assigned
    assert_not_nil assigns(:activities) 
  end

  test "should show activity" do
    get user_activity_url(@activity)
    assert_response :success
  end

  test "should destroy activity" do
    assert_difference("UserActivity.count", -1) do
      delete user_activity_url(@activity)
    end

    assert_redirected_to user_activities_url
  end
end