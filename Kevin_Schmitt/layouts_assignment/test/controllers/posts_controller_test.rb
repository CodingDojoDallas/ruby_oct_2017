require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  test "should get index_posts" do
    get :index_posts
    assert_response :success
  end

end
