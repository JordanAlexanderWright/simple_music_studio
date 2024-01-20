require "test_helper"

class RequestPaymentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get request_payments_index_url
    assert_response :success
  end

  test "should get new" do
    get request_payments_new_url
    assert_response :success
  end
end
