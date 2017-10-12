require 'test_helper'

class SaysControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get hello" do
    get :hello
    assert_response :success
  end

  test "should get joe" do
    get :joe
    assert_response :success
  end

  test "should get michael" do
    get :michael
    assert_response :success
  end

end
