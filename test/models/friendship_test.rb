require "test_helper"

class FriendshipTest < ActiveSupport::TestCase
  test "user cannot follow themselves" do
    user = User.create
    friendship = user.friendships.build(friend_id: user.id)
    friendship.save
    assert_not friendship.valid?
    assert_includes friendship.errors[:friend_id], "cannot friend yourself"
  end

  test "user cannot follow a user twice" do
    user1 = User.create(email: "one@example.com", password: "password")
    user2 = User.create(email: "two@example.com", password: "password")
    friendship = user1.friendships.build(friend_id: user2.id)
    assert friendship.valid?
    assert_equal user2.id, friendship.friend_id
    assert_equal user1.id, friendship.user_id
    friendship.save

    friendship2 = user1.friendships.build(friend_id: user2.id)
    assert_not friendship2.valid?
    assert_includes friendship2.errors[:friend_id], "has already been taken"
  end
end
