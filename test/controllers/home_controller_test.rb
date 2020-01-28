require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url
    assert_response :success
  end

  test "shoudl get the signup page" do
    assert_routing '/signup', controller: 'organizations', action: 'new'
    get signup_url
    assert_response :success
  end
end
