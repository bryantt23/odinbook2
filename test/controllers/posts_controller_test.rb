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

  test "current user gets correct feed" do
    sign_in @user

    user2 = User.create(email: "two@example.com", password: "password")
    user3 = User.create(email: "three@example.com", password: "password")

    @user.posts.create(subject: "Subject by @user", content: "The content by @user")
    @user.friendships.create(friend_id: user2.id)

    user2.posts.create(subject: "Subject by user2", content: "The content by user2")
    user3.posts.create(subject: "Subject by user3", content: "The content by user3")
        
    get posts_path 

    assert_match("Subject by @user", response.body)
    assert_match("Subject by user2", response.body)
    assert_no_match("Subject by user3", response.body)    
  end
end
