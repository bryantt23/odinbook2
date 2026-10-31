require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = User.create!(email: 'test@example.com', password: 'password123')
  end

  test "should get index" do
    sign_in @user
    # 1. Simulate a GET request to the posts index URL
    get posts_path 
    
    # 2. Assert that the server responded with a 200 OK status
    assert_response :success 
    
    # 3. Optional: Verify that specific content is rendered in the HTML body
    assert_match "Posts", @response.body 
  end
end
