require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get hello" do
    get :hello
    assert_response :success
  end

  test "should get sayinghello" do
    get :sayinghello
    assert_response :success
  end

  test "should get hellojoe" do
    get :hellojoe
    assert_response :success
  end

end
