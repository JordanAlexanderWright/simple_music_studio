require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get dashboard_home_url
    assert_response :success
  end

  test "should get users" do
    get dashboard_users_url
    assert_response :success
  end

  test "should get admin" do
    get dashboard_admin_url
    assert_response :success
  end
end
