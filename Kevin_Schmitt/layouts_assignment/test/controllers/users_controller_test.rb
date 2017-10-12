require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get index_users" do
    get :index_users
    assert_response :success
  end

end
