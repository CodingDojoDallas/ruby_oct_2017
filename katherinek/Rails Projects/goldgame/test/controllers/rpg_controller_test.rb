require 'test_helper'

class RpgControllerTest < ActionController::TestCase
  test "should get indext" do
    get :indext
    assert_response :success
  end

  test "should get getgold" do
    get :getgold
    assert_response :success
  end

end
